=begin
Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],
                        a
                           b
                              c 
A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]

-- put the whole thing into a hash table

loop through all elements

second loop starts and first element + 1
  - look for necessary item in hash table
  - if it exists check its index
    - if its index is greater than current second loop element
 

-- last loop could be a hash lookup? 
-- we know the sum of the first two element

-- 

naive solution, brute force: (time limit exceeded for leetcode)

i = 0 to nums.length
  j = i + 1 to nums.length
    k = j + 1 to nums.length

    if i + j + k == 0, push [i, j, k] to result array

=end

# def three_sum(nums)
#   result = []
#   i = 0
#   while i < nums.length
#     j = i + 1
#     while j < nums.length
#       k = j + 1
#       while k < nums.length
#         if nums[i] + nums[j] + nums[k] == 0
#           triplet = [nums[i], nums[j], nums[k]].sort
#           result.push(triplet) unless result.include?(triplet)
#         end
#         k += 1
#       end
#       j += 1
#     end
#     i += 1
#   end

#   result
# end

# @param {Integer[]} nums
# @return {Integer[][]}

# Iterate through nums

#  [-1,0,1,2,-1,-4]

# For each num, in the remaining array, is there a pair of numbers that is the current num * -1

# times out after passing 316/318 tests

def three_sum(nums)
  hash = {}
  
  nums.each_with_index do |current, idx|
    temp = two_sum(nums, idx)
    
    temp.each do |arr|
      arr.push(current)
      arr.sort!
      if !hash[arr]
        hash[arr] = true
      end
    end
  end
  
  hash.keys
end


def two_sum(nums, target_idx)
  map = {}
  result = []
  target = nums[target_idx] * -1
  
  index = 0
  
  while index < nums.length
    if index == target_idx
      index += 1
      next
    end
    
    current = nums[index]
    
    desired_index = map[target - current]
    if desired_index
      result.push([nums[index], nums[desired_index]])
    else
      map[current] = index
    end
    index += 1
  end
  
  result
end