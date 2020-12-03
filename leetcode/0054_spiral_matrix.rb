=begin
Algo: 
1. shift off first array 
    - shift elements until empty 
    - remove empty subarray 
2. iterate subarrays 
    - pop once on each 
3. take last subarray 
    - pop until empty 
4. iterate subarray from last to first
    - shift once each
=end

def spiral_order(matrix)
  copy = copy_matrix(matrix)
  result = []

  loop do
    # step 1, shift off first array, shift elements and push elements onto result
    row = matrix.shift
    break unless row
    while row.length > 0
      result.push(row.shift)
    end

    break if matrix.length == 0

    # step 2, pop elements off remaining array, push to result
    matrix.each do |row|
      result.push(row.pop) if row.length > 0
    end

    # step 3, pop off last row, pop elements and push to result
    row = matrix.pop
    break unless row
    while row.length > 0
      result.push(row.pop)
    end

    break if matrix.length == 0

    # step 4, shift off first element of remaining rows, in reverse order
    matrix.reverse_each do |row|
      result.push(row.shift) if row.length > 0
    end

  end

  return result
end

def copy_matrix(m)
  m
end

matrix = [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
]

p spiral_order(matrix)

matrix2 = [
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9,10,11,12]
]

p spiral_order(matrix2)

p spiral_order([[7],[9],[6]])
p spiral_order([[7, 9, 6]])
