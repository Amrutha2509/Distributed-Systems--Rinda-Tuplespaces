require 'rinda/rinda'
DRb.start_service
$ts = DRbObject.new_with_uri('druby://localhost:8000')

tuples = [["Bob","distsys","I am studying chap 2"],["Bob","distsys","The linda example’s pretty simple"],["Bob","distsys","CoolBook!"],["alice","gtcn","This graph theory stuff is not easy"],["alice","distsys","I like systems more than graphs"]]

tuples.each do |t|
	$ts.write(t)
end

puts $ts.read(["Bob","distsys",nil])
puts $ts.read(["alice","gtcn",nil])
puts $ts.read(["Bob","gtcn",nil]) 




