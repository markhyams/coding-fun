=begin
1, 3, 1   
1, 5, 1 
4, 2, 1

eliminate top row:

1, 5, 1
4, 2, 1

eliminate left col:
3, 1
5, 1
2, 1

base case is when there is one row OR one col, then we sum that col or row
  
- move pointers or actually remove cols and rows?



top-down: call min_path_sum on right neighbor (eliminate left column) and min_path_sum on lower neighbor (elimnate top row)

choose lessor of these two calls and add to the current cell
=end

require 'pry'

# non-memoized solution times out after 20 tests

def min_path_sum(grid)
  min_path_sum_helper(grid, 0, 0)
end
  

def min_path_sum_helper(grid, row, col)
  cols = grid[0].length
  rows = grid.length

  # beyond matrix
  if row > rows - 1 || col > cols - 1
    return Float::INFINITY
  end
  

  current = grid[row][col]

  # base case, bottom right:
  if row == rows - 1 && col == cols - 1
    return current
  end

  # compare min sum of one to the right to the sum of one below
  right = min_path_sum_helper(grid, row, col + 1)
  below = min_path_sum_helper(grid, row + 1, col)

  current + [right, below].min
end



matrix = [
  [1, 3, 1],
  [1, 5, 1],
  [4, 2, 1]
]

leet_matrix = [ # 6
  [1,2,5],
  [3,2,1]
]

mat = [    # 5
  [2, 5],
  [2, 1]
]

mat2 = [ # 12
  [2, 1],
  [3, 2],
  [1, 3],
  [2, 4]
]

mat3 = [ [5] ]
p min_path_sum(leet_matrix) # 6
p min_path_sum(matrix) # 7
p min_path_sum(mat2) # 12
p min_path_sum(mat) # 5
p min_path_sum(mat3) # 5

# @param {Integer[][]} grid
# @return {Integer}

def min_path_sum(grid)
  min_path_sum_helper(grid, 0, 0, {})
end
  

def min_path_sum_helper(grid, row, col, cache)
  cols = grid[0].length
  rows = grid.length

  # beyond matrix
  if row > rows - 1 || col > cols - 1
    return Float::INFINITY
  end
  

  current = grid[row][col]

  # base case, bottom right:
  if row == rows - 1 && col == cols - 1
    return current
  end

  # compare min sum of one to the right to the sum of one below
  right = cache[[row, col + 1]] || min_path_sum_helper(grid, row, col + 1, cache)
  below = cache[[row + 1, col]] || min_path_sum_helper(grid, row + 1, col, cache)

  cache[[row, col]] = current + [right, below].min
end
