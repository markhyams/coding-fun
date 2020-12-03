# @param {Integer[][]} triangle
# @return {Integer}

# input, two dimensional 'triangle' array

# arr = [
#   [2],
#   [3,4],
#   [6,5,7],
#   [4,1,8,3]
# ]

# 'height' of triangle is arr.length
# each row adds one more element, lengths of subarrays: 1, 2, 3, 4, 5... etc

# sub problem:

# Find the minimum sum of the two reachable numbers below, take the min of those two, and add to the current
# - always look down one row, with same index and index + 1

# start at 0, 0

# call recursively (row + 1, col) and (row + 1, col + 1)

# base case: 

# when we reach last row (row == arr.length), return the element itself

# bottom up approach:

# - copy input array
# - start with second to last row
# - iterate over row, for each element, set it equal to itself plus the lessor of the two elements below it.
# - repeat until getting to the top of the triangle
# - return arr[0][0]




def minimum_total(triangle)
  min_total_helper(triangle, 0, 0, {})
end
  
def min_total_helper(triangle, row, col, cache)
  base_row = triangle.length - 1
  current = triangle[row][col]
  
  # base case, at bottom row
  return current if row == base_row
  
  left_min = cache[[row + 1, col]] || min_total_helper(triangle, row + 1, col, cache)
  right_min = cache[[row + 1, col + 1]] || min_total_helper(triangle, row + 1, col + 1, cache)
  
  cache[[row, col]] = current + [left_min, right_min].min
end
