#!/usr/bin/env python3

import xmlrpc.client

proxy = xmlrpc.client.ServerProxy("http://localhost:1234/",allow_none=True)

tuples = [["*",2,3], [ "+",5,6], [ "-",2,1]]
for t in tuples:
	proxy._out(t)
	res=proxy._in(["result",None])
	print ("%s=%s%s%s" %(res[1],t[1],t[0],t[2]))


  
