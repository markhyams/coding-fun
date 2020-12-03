# @param {Integer[]} nums
# @return {Integer[][]}
# example with nums input as [1,2]

#       f      1      2 
#             / \     /
#            f   2   f
#               / 
#              f       
# we choose all the paths with a false at its end, 
# including the one with nothing before the false

# put false on front of nums, and iterate over this new array
# add elements to candidate if it is greater than last element or a 'false'
# when false is last element, we have a subset. pop off the false and add to result
# each iteration always starts with a 'false'

def subsets(nums)
  set = nums.clone.unshift(false)
  result = []
  backtrack(set, result, [])
  result
end

def backtrack(nums, result, candidate)
  # if the last element is false, we have a set
  if candidate.last == false
    # remove final element (the 'false' before pushing to results)
    result << candidate[0..-2]
    return
  end
  
  nums.each do |num|
    # if candidate is: empty OR num is false OR  num > last
    # add current num to candidate
    # we always add a false if it is there, because that will trigger a result set

    if candidate.empty? || num == false || num > candidate.last
      candidate << num

      backtrack(nums, result, candidate)
      candidate.pop
    end
  end
end