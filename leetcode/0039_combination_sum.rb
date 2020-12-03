# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}

# end of path is when sum is >= target
# push to candidate when sum is 
target = 8
      candidate = [2,3]
      
# 2 3 5
# i
# 2 3 5
#   i


# [2,2,2,2]


def combination_sum(nums, target)
  result = []
  backtrack(nums, target, result, [], 0)
  result
end

def backtrack(nums, target, result, candidate, position)
  # catherine psuedo code
  
  # check if sum is over target
#   if candidate.sum > target
#     return
#   end
  
  # check if sum equals target - > push to result  
  if candidate.sum == target
    result.push(candidate.clone)
    return
  end
  
  # iterate over nums skipping items before position
  # each with index, backtrack with current index as position
  nums.each_with_index do |num, idx|
  
    # skip items before position, or items that would take us over target
    if idx < position || candidate.sum + num > target
      next
    end
    
    # push it on to candidate
    candidate.push(num) # if candidate.sum + num < target
    
    # recursive call, will return immediately if candidate is a match or is too big
    # otherwise it dives down
    backtrack(nums, target, result, candidate, idx)
    
    # remove what we just put on the candidate array that caused a return
    # i.e. a result, or something too big
    candidate.pop
  end
end
  