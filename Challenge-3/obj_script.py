#!/usr/bin/python
def get_value(value, key):
    keys = key.split('/')
    for key in keys:
        try:
            value = value.pop(key)
            prt_value = value
        except BaseException as exception:
            logging.error(f"Exception Name: {type(exception).__name__}")
    return prt_value
