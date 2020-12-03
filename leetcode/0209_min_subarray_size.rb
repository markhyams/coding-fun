=begin
Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

Example: 

Input: s = 7, nums = [2,3,1,2,4,3]
                                                    a
                                  r
Output: 2

anchor = 0
runner = 0

min_size = 0, 4, 4, 3, 3, 2

length = r - a + 1
if sum >= target 
  if min_size == 0
    set min_size to length
  else 
    overwrite min_size if length is < min_size
  advance anchor
if sum < target
  advance runner


slice(a, r - a + 1).sum
=end

def min_sub_array_len(s, nums)
  anchor = 0
  runner = 0
  min_size = 0

  while runner < nums.length
    len = runner - anchor + 1                        
    sum = nums.slice(anchor, len).sum

    if sum >= s 
      if min_size == 0
        min_size = len
      else
        min_size = len if min_size > len
      end
      anchor += 1
    else 
      runner += 1
    end
  end

  min_size
end

p min_sub_array_len(7, [2,3,1,2,4,3]) # 2
p min_sub_array_len(6, [10, 2, 3]) # 1