#!/usr/bin/env python3

import xmlrpc.client

proxy = xmlrpc.client.ServerProxy("http://localhost:1234/",allow_none=True)


print (proxy._out(["alice","gtcn","This graph theory stuff is not easy"]))
print (proxy._out(["alice","distsys","I like systems more than graphs"]))
