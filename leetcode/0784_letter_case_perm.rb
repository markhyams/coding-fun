# @param {String} s
# @return {String[]}

# "ab"

# a b c
#   p

# A

# b       B

# c   C   c  C


# a

# b       B

# c   C   c  C

# top two cases, lowercase and upper case

# result array

# candidate string

# success condition/base case
# when candidate string.length == input.length

# branching logic
# if its not a number, branch off lower and uppercase
# else add it to candidate string

def letter_case_permutation(s)
  result = []
  backtrack(s, "", 0, result)
  result
end

def backtrack(string, candidate, pointer, result)
  #success
  if pointer >= string.length
    result << candidate
    return
  end
  
  # keep adding numbers to candidate
  while /[0-9]/.match(string[pointer]) && pointer < string.length
    candidate += string[pointer]
    pointer += 1
  end
  
  if pointer == string.length
    result << candidate
    return
  end
  
    
  backtrack(string, candidate + string[pointer].upcase, pointer + 1, result)
  backtrack(string, candidate + string[pointer].downcase, pointer + 1, result)
end 
  
  
  