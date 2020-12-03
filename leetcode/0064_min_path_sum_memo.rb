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

# require 'pry'

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

mat4 = [[7,1,3,5,8,9,9,2,1,9,0,8,3,1,6,6,9,5],[9,5,9,4,0,4,8,8,9,5,7,3,6,6,6,9,1,6],[8,2,9,1,3,1,9,7,2,5,3,1,2,4,8,2,8,8],[6,7,9,8,4,8,3,0,4,0,9,6,6,0,0,5,1,4],[7,1,3,1,8,8,3,1,2,1,5,0,2,1,9,1,1,4],[9,5,4,3,5,6,1,3,6,4,9,7,0,8,0,3,9,9],[1,4,2,5,8,7,7,0,0,7,1,2,1,2,7,7,7,4],[3,9,7,9,5,8,9,5,6,9,8,8,0,1,4,2,8,2],[1,5,2,2,2,5,6,3,9,3,1,7,9,6,8,6,8,3],[5,7,8,3,8,8,3,9,9,8,1,9,2,5,4,7,7,7],[2,3,2,4,8,5,1,7,2,9,5,2,4,2,9,2,8,7],[0,1,6,1,1,0,0,6,5,4,3,4,3,7,9,6,1,9]]


p min_path_sum(leet_matrix) # 6
p min_path_sum(matrix) # 7
p min_path_sum(mat2) # 12
p min_path_sum(mat) # 5
p min_path_sum(mat3) # 5
p min_path_sum(mat4)


