=begin
Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.

Note:

Your returned answers (both index1 and index2) are not zero-based.
You may assume that each input would have exactly one solution and you may not use the same element twice.
Example:

Input: numbers = [2,7,11,15], target = 9
                    P
table[2] = 0


Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.

two pointers, beginning and end, move towards middle
while the first < last

first + last == target
return [first + 1, last + 1]
first + last < target, last--
first + last > target, first++

=end


def two_sum(numbers, target)
  first = 0
  last = numbers.length - 1

  while first < last
    sum = numbers[first] + numbers[last]
    if sum == target
      return [first + 1, last + 1]
    elsif sum > target
      last -= 1
    elsif sum < target
      first += 1
    end
  end
end

p two_sum([2,7,11,15], 9) # [1, 2]