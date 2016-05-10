#!/usr/bin/env python
import random
import sys
import os
quotes_path = os.path.join(os.path.dirname(__file__), "quotes.txt")

num_lines = sum(1 for line in open(quotes_path))
line_of_the_day = random.randrange(0, num_lines)
quote_of_the_day = ""

with open(quotes_path) as fp:
	for i, line in enumerate(fp):
		if (i == line_of_the_day):
			quote_of_the_day = line
			break

if (quote_of_the_day == ""):
	print("Something bad happened.")
	sys.exit()

with open('/etc/motd', 'w') as file:
	file.write(quote_of_the_day)