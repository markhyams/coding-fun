# @param {Integer[]} nums
# @return {Boolean}

# top-down:

# Last element value doesn't matter?


# call recursively on possible subarrays

# base case: first element >= (array.length - 1) OR, array.length == 2 and first element == 0
# the first number in the array represents the number of possible subarrays.
  
# [2, 3, 1, 1, 4] two possibilities:
p
1

# [3, 1, 1, 4] and [1, 1, 4]





# 3, 2, 1, 0, 4


# 2, 1, 0, 4 => 1, 0, 4 and 0, 4

# 1, 0, 4 => 0, 4

# 0, 4 => false


# 3, 2, 2, 0, 4

# a = func(2, 2, 0, 4
# b = func(2, 0, 4
# c = func(0, 4

# a || b || c






# first array evaluates to 

# require 'pry'

def can_jump(nums)
  can_jump_helper(nums, 0, {})
end

def can_jump_helper(nums, p, cache)
  current_elem = nums[p]
  end_idx = nums.length - 1

  # base cases
  # if current elem is equal to or greater than the distance to final element
  if current_elem >= end_idx - p
    return true
  end
  
  #first element is zero 
  if current_elem == 0 
    return false
  end
  
  # loop to make a number recursive calls equal to current_elem
  # previous check prevents us from making extra calls (past end of array, we already know that we can't reach the end of the array in one step)

  (1..current_elem).each do |offset|
    new_p = p + offset
 
    # check if we have called function already
    if cache[new_p] != nil
      # if it is true, return early
      return cache[new_p] if cache[new_p]
    else
      # otherwise cache the recursive call
      cache[new_p] = can_jump_helper(nums, new_p, cache)

      # if it is true true, return early
      return true if cache[new_p]
    end
  end
  
  cache[p] = false
end




p can_jump([3,2,1,0,4]) # false
p can_jump([5,9,3,2,1,0,2,3,3,1,0,0]) # true












