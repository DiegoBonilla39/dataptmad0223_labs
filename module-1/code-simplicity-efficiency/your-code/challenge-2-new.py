"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.
"""

import random
import string

string = string.ascii_lowercase + string.digits

minimum = int(input('Enter minimum string length: '))
maximum = int(input('Enter maximum string length: '))
n_string = int(input('How many random strings to generate? '))

if (minimum > maximum) or (minimum < 0) or (maximum < 0):
    print('Incorrect min and max string lengths. Try again.')
elif maximum == minimum:
    print([''.join(random.sample(string, maximum)) for i in range(n_string)])
else:
    minimum = list(range(minimum + 1))
    print([''.join(random.sample(string, maximum - random.choice(minimum))) for i in range(n_string)])