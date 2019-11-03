#!/bin/bash
pandoc -f markdown README.md -t html -V geometry:margin=.5in > index.html
exit 0


#!/usr/bin/env python
# -*- coding: utf-8 -*-
 
import pypandoc
 
# With an input file: it will infer the input format from the filename
output = pypandoc.convert_file('index.md', 'html', outputfile='index.html')
