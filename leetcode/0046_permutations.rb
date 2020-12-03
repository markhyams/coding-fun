# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  result = []
  backtrack(nums, [], result)
  result
end

def backtrack(nums, candidate, result)
  # if candidate array is full
  # we are only adding valid items
  if candidate.length == nums.length
    # push it to result
    result << candidate.clone
    return
  end
  # if end-of-path
    # if succes, push candiidate to result
    # else (it's a dead end) return
  # else
    
  nums.each do |n|
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