# @param {Integer[]} nums
# @return {Integer[][]}

def permute_unique(nums)
  result = {}
  backtrack(nums, [], result)
  result.keys
end

def backtrack(nums, candidate, result)
  # if candidate array is full
  # we are only adding valid items
  if candidate.length == nums.length
    # add it to result if if not there already
    # maps indexes to values and check if it is unique in the result
    arr = candidate.map { |idx| nums[idx] }
    if !result[arr]
      result[arr] = true
    end
    
    return
  end
    
  # creating permutations of indexes
  nums.length.times do |n|
    # optimize branching logic here
    # if the candidate element does not include the current element, add it
    if !candidate.include?(n)
      candidate << n
      # backtrack will return immediately if array is full, adding to result, otherwise keep calling recursively
      backtrack(nums, candidate, result)
      candidate.pop # cleanup - we have added this element already, so remove it before return to level up
    end
  end
end

def next_idx(num, arr_length)
  num + 1 == arr_length ? 0 : num + 1
end