# -*- coding: utf-8 -*-
"""
Created on Sun Oct 25 01:11:34 2020

@author: Cher
"""

#!/usr/bin/env python
# coding: utf-8

import sys

for line in sys.stdin:
    line = line.strip()
    vtime = line.split(",")[19]
       
    if vtime != "Violation Time":
        print('%s\t%s' % (vtime, '1'))
              
    elif vtime == "":
        print('%s\t%s' % ("No Record", '1'))