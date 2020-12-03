=begin
Find max number in an array, return the number

top-down:
assume max_in_array function exists, call it for each half of the array, then return the greater number

base case when array is one element, just return that element

=end

def max_in_array(arr)
  # base case when array is one element:
  if arr.length == 1
    return arr[0]
  end

  # divide array in half:
  mid = arr.length / 2

  left_array = arr[0, mid]
  right_array = arr[mid, arr.length - mid]

  # recursive call
  left_max = max_in_array(left_array)
  right_max = max_in_array(right_array)

  # combine
  left_max > right_max ? left_max : right_max
end

p max_in_array([1, 2, 3, 4, 5]) # 5
p max_in_array([1, 2, 3, 2, -1, 4, 11, 5]) # 11

