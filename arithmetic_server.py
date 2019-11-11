#!/usr/bin/env python3

import xmlrpc.client
import operator

proxy = xmlrpc.client.ServerProxy("http://localhost:1234/",allow_none=True)

allowed_operators={
    "+": operator.add,
    "-": operator.sub,
    "*": operator.mul}
flag=1
while flag == 1:
	ops,a,b = proxy._in(["^[-+/*]$", "Numeric", "Numeric"])
	result = allowed_operators[ops](a,b)
	print(proxy._out(["result",result]))

