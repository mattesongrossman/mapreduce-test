#!/usr/bin/python
# --*-- coding:utf-8 --*--
import re
import sys

file_object = open("../../mapreduce-test-data/access.log","r")

pat = re.compile('(?P<ip>\d+\.\d+\.\d+\.\d+).*?\d{4}:(?P<hour>\d{2}:\d{2}).*? ')

for line in file_object:
    match = pat.search(line)
    if match:
        print ('[' + match.group('hour') + ':00' + ']' + match.group('ip'), 1)
