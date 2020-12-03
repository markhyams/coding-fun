=begin


Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

Example 1:

Given nums = [1,2,2],
                w
                  r

Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.

It doesn't matter what you leave beyond the returned length.

=end

def remove_duplicates(nums)
  writer = 0
  reader = 1

  return writer if nums.empty?

  while reader < nums.length
    if nums[reader] != nums[writer]
      writer += 1 
      nums[writer] = nums[reader]
    end
    reader += 1
  end
  
  (nums.length - writer - 1).times do
    nums.pop
  end

  writer + 1
end




p remove_duplicates([0,0,1,1,1,2,2,3,3,4]) # 5
p remove_duplicates([1, 1, 2]) # 2
p remove_duplicates([]) # 0