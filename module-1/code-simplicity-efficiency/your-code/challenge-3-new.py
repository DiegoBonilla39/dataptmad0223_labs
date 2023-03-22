"""
You are presented with an integer number larger than 5. Your goal is to identify the longest side
possible in a right triangle whose sides are not longer than the number you are given.

For example, if you are given the number 15, there are 3 possibilities to compose right triangles:

1. [3, 4, 5]
2. [6, 8, 10]
3. [5, 12, 13]
"""

x = int(input("What is the maximal length of the triangle side? Enter a number: "))

# Obtain all the possible triangles
all_triangles = [sorted([i, j, k]) for i in range(1, x) for j in range(1, x) for k in range(1, x)]

# Obtain all the possible right triangles
right_triangles = [list(x) for x in set(tuple(x) for x in [sorted(i) for i in all_triangles if i[0]**2 + i[1]**2 == i[2]**2])]

# Print the longest side possible
print("The longest side possible is " + str(max([j for i in right_triangles for j in i])))