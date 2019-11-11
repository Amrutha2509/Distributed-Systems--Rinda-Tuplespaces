require 'xmlrpc/server'
require 'rinda/rinda'

def suppress_warnings
    previous_VERBOSE, $VERBOSE = $VERBOSE, nil
    yield
    $VERBOSE = previous_VERBOSE
end

suppress_warnings do
    XMLRPC::Config::ENABLE_NIL_PARSER = true
    XMLRPC::Config::ENABLE_NIL_CREATE = true
end

#Create an XMLPRC Server
s = XMLRPC::Server.new(1234)
#Connect to the Rinda TupleSpace
DRb.start_service
$ts = DRbObject.new_with_uri('druby://localhost:8000')
#handlers
s.add_handler "_out" do |t|
	result = $ts.write(t)
	puts t.inspect
	puts result.inspect
	'ok' # just to make sure it returns "ok" when tuples are inserted from python client programs
end
s.add_handler "_in" do |t|
	if t[0] == "^[-+/*]$" #check for regular expression
		puts "RUBY match: "+ t[0] 
		r1 = Regexp.new(t[0])
	if t[1] == "Numeric" and t[2] == "Numeric"
		op1 = Module.const_get(t[1])
		op2 = Module.const_get(t[2])
		$ts.take([ r1,op1,op2])
	end
	else
		$ts.take(t) 
	end
end
s.add_handler("_r") do |t|
	if t[0] == "String" and t[2] == "String" #this condition is for an instance where chuck tries to read a tuple [str,distys,str]
		op1 = Module.const_get(t[0])
		str = t[1]
		read_all_t = $ts.read_all([op1,str,op1])
	else
		$ts.read_all(t) #return all matched tuples for say t = ["bob","distys","chap1 is tough"], could be $ts.read(t) to return a 					single matched tuple
	end
end
s.add_handler("_rd") do |t|
	$ts.read_all(t)
end
s.serve



