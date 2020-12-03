# one step -> one way
# two steps -> two ways (1 + 1, or 2)
# three steps -> three ways (1 + 1+1, 1+2, 2+ 1)
# four steps -> five ways (1+1+1+1, 1+2+1, 1+1+2, 2+1+1, 2+2)
# five steps -> 




# 20th step
# from 19 to 20, one way
# from 18 to 20, two ways
# from 17 to 20, three ways
# from 16 to 20, five ways

# # nth step = steps(n-1) + steps(n-2)

# # base cases
# one step = 1
# two steps = 2

def climb_stairs(n, memo = {})
  #base cases
  if n == 1
    return 1
  elsif n == 2
    return 2
  end
  
  one_below = memo[n-1] || climb_stairs(n - 1, memo)
  two_below = memo[n-2] || climb_stairs(n -2, memo)
  
  memo[n] = one_below + two_below
end