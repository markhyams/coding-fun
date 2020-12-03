=begin
  
start with array of parens

hash ( = 1
) = -1

add them up to make sure they are never invalid
=end
require 'pry'

def generate_parenthesis(input)
  n = input * 2
  results = []
  parens = ["(", ")"]
  backtrack(n, parens, [], results)
  results
end

def backtrack(n, parens, candidate, results)
  candidate_parens = candidate.join
  if candidate_parens.length == n 
    results << candidate_parens if valid_parens(candidate_parens)
    return
  end

  parens.each do |paren|
    candidate << paren
    backtrack(n, parens, candidate, results)
    candidate.pop
  end
end

def valid_parens(str)
  return false if str.length == 0
  value = {
    "(" => 1,
    ")" => -1
  }
  
  total = 0
  i = 0
  while i < str.length 
    total += value[str[i]]
    return false if total < 0
    i += 1
  end

  total ==  0
end

# p valid_parens("((()))") == true
# p valid_parens("((())") == false
# p valid_parens("()()") == true
# p valid_parens("())(") == false
# p valid_parens("())()(") == false
# p valid_parens(")(") == false
# p valid_parens(")") == false
# p valid_parens("") == false

p generate_parenthesis(3)