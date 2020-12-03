=begin
find number in array, return its index

top down

assume we have a find_index function already implemented

call find_index(arr, pointer = 0)

check if arr[pointer] == target

if not, call find_index(arr, pointer += 1)
base case:

when pointer is past end of array, return -1 


need to track indexes, maybe better to implement as a recursive iteration?


start at index 0
call find_index


=end

def find_index(arr, target, idx = 0)
  # base case
  return -1 if idx >= arr.length

  return idx if arr[idx] == target

  find_index(arr, target, idx + 1)
end

 arr = [1, 2, 3, 4, 11, 4, 3, 2]

 p find_index(arr, 11) # 4
 p find_index(arr, 2) # 1
 p find_index(arr, 15) # -1


#  will's code:


def find_number(ary, num)  
     find_number_helper(ary, num, 0, ary.length - 1)   # 0, 3
end

def find_number_helper(ary, num, start_index, end_index) 
  #base 
  if start_index == end_index
    return ary[start_index] == num ? start_index : -1  
  end

  # divide 
  middle = (start_index + end_index) / 2
  
  # conquer 
  left = find_number_helper(ary, num, start_index, middle)
  right = find_number_helper(ary, num, middle+1, end_index)

  # combine 
  if left == -1 && right == -1 
    -1 
  elsif left != -1 
    left 
  else 
    right 
  end 
end 


p find_number([1,4,6,8], 1) # 0
p find_number([1,4,6,8], 8) # 3
p find_number([1,4,6,8], 15) # -1

 



