=begin
Given a positive integer num, write a function which returns True if num is a perfect square else False.

Follow up: Do not use any built-in library function such as sqrt.

 

Example 1:

Input: num = 16
Output: true
Example 2:

Input: num = 14
Output: false
 

Constraints:

1 <= num <= 2^31 - 1
somehow use a binary search to check if a value is a square

start with num

start with 
16

1                18                36
1              17
        9
       8 
    4
     5 

divide by 2

          4 square greater than or less than num

1                     11
           6

1         5
     3
       4  5
       4

       4
       4

        
=end

def is_perfect_square(num)
  return true if num == 1
  left = 1
  right = num / 2

  while right >= left
    middle = (left + right) / 2

    square = middle * middle
    return true if square == num

    if square > num
      right = middle - 1
    else
      left = middle + 1
    end
  end

  false
end

p is_perfect_square(9) # true
p is_perfect_square(1) # true
p is_perfect_square(11) # false
p is_perfect_square(11) # false
p is_perfect_square(207936) # true