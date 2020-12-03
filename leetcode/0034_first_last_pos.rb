=begin
Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

Your algorithm's runtime complexity must be in the order of O(log n).

If the target is not found in the array, return [-1, -1].

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]

- what does binary search do when there are two values?

  [5,7,7,8,8,10]
         l       
           m     
             r

  once found, move pointer to the right until it is not found, return the last found pointer
  also move pointer to the left until it is not found


  [5,7,7,8,8,8,8,8,8,8,8,8,10]
   l
               m
                            r

  [5,5,5,5,5,5,5,8,8,8,8,8,10]
                 l
                     m
                           r

use search insert as subroutine
do binary search
if we find the target, call
  search_insert with target + 1 on the right part of the remaining array
  and search insert with target - 1 on the left part of the remaining array
=end

def search_insert(nums, target)
  left = 0
  right = nums.length - 1

  while right >= left
    middle = (left + right) / 2

    return middle if nums[middle] == target

    if target < nums[middle]
      right = middle - 1
    else
      left = middle + 1
    end
  end

  left
end

def search_range(nums, target)
  left = 0
  right = nums.length - 1
  target_idx = nil

  while right >= left
    middle = (left + right) / 2
    
    if nums[middle] == target
      target_idx = middle 
      break
    end

    if target < nums[middle]
      right = middle - 1
    else
      left = middle + 1
    end
  end

  return [-1, -1] unless target_idx
  # go left until we don't find the target
  first_pos = target_idx
  while nums[first_pos] == target && first_pos >= 0
    first_pos -= 1
  end

  # go right until we don't find the target
  last_pos = target_idx
  while nums[last_pos] == target && last_pos < nums.length
    last_pos += 1
  end

  # left_arr = nums.slice(0, target_idx)
  # right_arr = nums.slice(target_idx + 1, nums.length - target_idx + 1)
  # first_pos = search_insert(left_arr, target - 1)
  # last_pos = search_insert(right_arr, target + 1)
  return [first_pos + 1, last_pos - 1]
    
end

p search_range([5,7,7,8,8,10],6) # [-1, -1]
p search_range([5,7,7,8,8,10,11,12],8) # [3, 4]
p search_range([5,7,7,8,8,8,8,8,8,8,8,8,10], 8) # [3, 11]
p search_range([8,8,8,8,8,8,8,8,8], 8) # [0, 8]




