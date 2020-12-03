# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}

# as we recursively call backtrack, increase the current number so as to avoid
# duplicates

def combine(n, k)
  result = []
  backtrack(n, k, result, [], 1)

  result
end

def backtrack(highest_num, size, result, candidate, current_num)
  if candidate.size == size
    result << candidate.clone
    return
  end

  while current_num <= highest_num
    candidate << current_num

    backtrack(highest_num, size, result, candidate, current_num + 1)
    candidate.pop

    current_num += 1
  end
end
