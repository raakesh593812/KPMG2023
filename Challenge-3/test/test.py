#!/usr/bin/python
from obj_script import get_value
import logging

object = {'x': {'y': {'z': 'a'}}}
key = 'x/y/z'

testobj = {'a':{'b':{'c':'d'}}} 
testkey = 'a/b/c'

print("Value for object" + str(object) + "and key " + key + " is :", get_value(object, key))
print("Value for object" + str(testobj) + "and key " + testkey + " is :", get_value(testobj, testkey))
