#!/usr/bin/env python3

import sys
import json

rawInput = sys.stdin.read()
if rawInput[-1] == '\n':
    rawInput = rawInput[:-1]
print(json.dumps(rawInput), end='')

