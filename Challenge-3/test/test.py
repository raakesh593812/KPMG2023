#!/usr/bin/python

import logging

def get_value(value, key):
    keys = key.split('/')
    for key in keys:
        try:
            value = value.pop(key)
            prt_value = value
        except BaseException as exception:
            logging.error(f"Exception Name: {type(exception).__name__}")
    return prt_value

object = {'x': {'y': {'z': 'a'}}}
key = 'x/y/z'

testobj = {'a':{'b':{'c':'d'}}} 
testkey = 'a/b/c'

print("Value for object" + str(object) + "and key " + key + " is :", get_value(object, key))
print("Value for object" + str(testobj) + "and key " + testkey + " is :", get_value(testobj, testkey))
