=begin
Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Example:

Input: [1,3,12,0, 0]
               w
                    r

when reader != 0, write the value of reader to writer index
advance both reader and writer

when reader == 0, advance only reader

when reader reaches end array, write zeros to the rest of the array
Output: [1,3,12,0,0]
=end

def move_zeroes(nums)
  reader = 0
  writer = 0

  while reader < nums.length
    if nums[reader] != 0
      nums[writer] = nums[reader]
      writer += 1
    end

    reader += 1
  end

  while writer < nums.length
    nums[writer] = 0
    writer += 1
  end
end

p nums = [0, 1, 0, 3, 12]
move_zeroes(nums)
p nums