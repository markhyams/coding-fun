grid = []
File.open('03.txt', 'r') do |f|
  f.each_line do |line|
    grid << line.chomp
  end
end

def count_trees(grid, down = 1, right = 3)
  width = grid.first.length
  trees = 0
  row = 0
  col = 0

  while row < grid.length
    line = grid[row]

    trees += 1 if line[col % width] == '#'
    col += right

    row += down
  end

  trees
end

p count_trees(grid) == 205

a = count_trees(grid, 1, 1)
b = count_trees(grid, 1, 3)
c = count_trees(grid, 1, 5)
d = count_trees(grid, 1, 7)
e = count_trees(grid, 2, 1)

p (a * b * c * d * e) == 3952146825
