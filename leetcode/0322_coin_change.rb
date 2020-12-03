=begin
# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}

fewest number of coins

given an array representing available coins

top-down:

take the max of the coins, subtract from amount 
  - if new total is greater than the smallest coin
    - recursively call the function on new total
  - else try subtracting next smallest coin
    if new total is greater than the smallest coin
      -recursively call the funtion on the new total
      

total = 13
coins = [1, 2, 5]



coins(13) -> coins(8) -> coins(3) -> coins(2) -> coins (1)

amount 7

coins [3, 2]

coins(7) -> coins(4)  -> 4 minus 3 is smaller than smallest coin
                         try 4 - 2


11 - 5 = 6

coin(6) -> 6 - 5 = 1

[2]
3 -> subtract 2, and call coins(1)
1 - 2

assume array of coins is sorted?

need to pass around a count variable, every time subtract an amount, increment count

base case is when amount is zero after using a coin, or if less than zero return -1
  
algorithm:
set count to zero
amount - largest coin
  is new amount larger than smallest coin?
    if so, subtract next smallest coin
=end

require 'pry'

def coin_change(coins, amount)
  coin_ptr = coins.length - 1
  coin_helper(coins.sort, amount, coin_ptr, 0)
end

def coin_helper(coins, amount, coin_ptr, count)
  # base case, if we have subtracted all the way to zero
  return count if amount == 0

  # we have tried all coins
  return -1 if coin_ptr < 0

  min_coin = coins[0]

  # get current coin
  current_coin = coins[coin_ptr]


  # while amount >= 0, keep subtracting current coin, increment counter
  # before subtracting, check if subtraction will make amount less than smallest coin

  while amount > 0
    new_amount = amount - current_coin

    # we go with new amount if is zero (the end) or if it is >= smallest coin
    if new_amount == 0 || new_amount >= min_coin
      amount = new_amount
      count += 1
    else
      break
    end
  end

  coin_helper(coins, amount, coin_ptr - 1, count)
end

p coin_change([1, 2, 5], 11) # 3
p coin_change([2, 3], 7)     # 3
p coin_change([2], 3) # -1
p coin_change([2, 5, 10, 1], 27) # 4
p coin_change([186,419,83,408], 6249) # 20