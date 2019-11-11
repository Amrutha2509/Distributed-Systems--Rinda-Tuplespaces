#!/usr/bin/env python3

import xmlrpc.client

proxy = xmlrpc.client.ServerProxy("http://localhost:1234/",allow_none=True)


print (proxy._rd(["alice","gtcn",None]))
print (proxy._rd(["bob","distsys",None]))
print (proxy._rd(["bob","gtcn",None]))
