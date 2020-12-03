# @param {Integer[][]} grid
# @return {Integer}


# must start at a non-zero 
# at most 25 non-zero cells
# each number is between 0 and 100
# maximum grid size is 15 x 15

# somehow keep track of visited cells

# find starting positions
# iterate through each element of matrix to produce an list of coordinates that can be started from.
# this is our top-level iteration

# the internal iteration (within the backtrack call) is going up,down,left,right
# check if moved-to cell is not in the matrix, if it is not, next
# check if moved-to cell is zero, if it is, next
# check if moved-to cell is in the list of visited cells, if it is, next

# add this path to the list of visited cells (candidate set)
# backtrack with this cell as the new starting point, passing through the grid, candidate, result,
# pop 

# if we exit out of loop, it means we cannot move any more, so we push candidate to result set

# after all the backtracking, sum up all the paths, and find the maximum sum




# then iterate through the list of coordinates, moving
def get_maximum_gold(grid)
  result = []
  
  # generate starting points
  # iterate through starting points, calling backtrack with eachone
  starting_points(grid).each do |starting_point|
    backtrack(grid, result, [starting_point], starting_point)
  end
  
  result.map do |array|
    array.map do |point|
      grid[point[0]][point[1]]
    end.sum
  end.max
end

def backtrack(grid, result, candidate, point)
  

  # success condition
  end_move = true
  
  possible_moves(point).each do |pnt|
    # next if:
    # point not in grid OR
    # point value == 0 OR 
    # point already visited (in candidate)
    
    if outside_grid(pnt, grid) || grid[pnt[0]][pnt[1]] == 0 || candidate.include?(pnt)
      next
    end
    
    end_move = false
    candidate << pnt
    backtrack(grid, result, candidate, pnt)
    candidate.pop
  end
  
  # tried all moves and none are allowed, we are at a stopping point
  # not sure about this
  if end_move
    result << candidate.clone
  end
  
end

def starting_points(grid)
  rows = grid.length
  cols = grid[0].length
  result = []
  row = 0
  
  while row < rows
    col = 0
    while col < cols
      if grid[row][col] > 0
        result << [row, col]
      end
      col += 1
    end
    row += 1
  end
  
  result
end

def outside_grid(point, grid)
  row = point[0]
  col = point[1]
  
  row >= grid.length || row < 0 || col >= grid[0].length || col < 0
end

def possible_moves(point)
  row = point[0]
  col = point[1]
  
  [[row, col + 1], [row, col - 1], [row + 1, col], [row - 1, col]]
end











