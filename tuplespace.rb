require 'rinda/tuplespace'
$ts = Rinda::TupleSpace.new
DRb.start_service("druby://localhost:8000", $ts)
puts DRb.uri
DRb.thread.join



