#!/usr/bin/env python3

import xmlrpc.client

proxy = xmlrpc.client.ServerProxy("http://localhost:1234/",allow_none=True)

print(proxy._out(["bob","distsys","I am studying chap 2"]))
print(proxy._out(["bob","distsys","The linda example’s pretty simple"])) 
print(proxy._out(["bob","gtcn","Cool book!"]))
#print (proxy._in(['bob', 'distsys', None]))

