=begin
A peak element is an element that is greater than its neighbors.

Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

You may imagine that nums[-1] = nums[n] = -∞. ** imagine that what is left and right of the array is negative infinity

Example 1:

Input: nums = [1,2,3,1]
Output: 2
Explanation: 3 is a peak element and your function should return the index number 2.
Example 2:

Input: nums = [1,2,1,3,5,6,4]
             a
               b
                 c 
Output: 1 or 5 
Explanation: Your function can return either index number 1 where the peak element is 2, 
             or index number 5 where the peak element is 6.
Follow up: Your solution should be in logarithmic complexity.

three pointer solution (k-pointer slide)

b = 0
a = b - 1
c = b + 1

if nums[b] > nums[a] && nums[b] > nums[c], return b
else
  increment a, b, c

stop when b reaches end of array

when b == 0, only compare to c
when b == nums.length - 1, only compare to a

- can array be less than three elements?
- unsure about what to do with first or last elements
if 

[1, 2] # 2 is peak element

[1, 2, 3, 4, 3, 2, 1, 2, 3, 4, 5, 4, 3]
          l
          m
          r

[1, 2, 3, 4, 5, 6, 7, 8, 9]
                         l
                         m
                         r

[9, 8, 7, 6, 5, 4, 3, 2, 1]
 l
 m
 r

binary search
the condition is:
  make sure surrounding numbers are not both greater!

  if number to the right of middle is greater than the middle
    left = middle + 1
  if number to the left of the middle is greater than the middle
    right = middle - 1

  return index because we found a peak
    
    
=end



def find_peak_element(arr)
  # guard clause for two-element array
  return arr[0] > arr[1] ? 0 : 1 if arr.length == 2

  left = 0
  right = arr.length - 1

  while right >= left
    middle = (left + right) / 2

    if middle == arr.length - 1
      return middle
    end


    # in a valley, go left aribtrarily
    if arr[middle + 1] > arr[middle] && arr[middle - 1] > arr[middle]
      right = middle - 1
    # going right has bigger number, go that way
    elsif arr[middle + 1] > arr[middle]
      left = middle + 1
    # going left has bigger number, go that way
    elsif arr[middle - 1] > arr[middle]
      right = middle - 1
    # both ways are less, so we return the peak
    else
      return middle
    end
  end
end

p find_peak_element([9, 8, 7, 6, 5, 4, 3, 2, 1]) # 0
p find_peak_element([1, 2, 3, 4, 5, 6, 7, 8, 9]) # 8
#                                            l
#                                            m
#                                            r 
p find_peak_element([1, 2, 3, 4, 3, 2, 1, 2, 3, 4, 5, 4, 3]) # 3 or 10
#                             p                    p     
p find_peak_element([1, 2]) # 1
p find_peak_element([3,4,3,2,1])
