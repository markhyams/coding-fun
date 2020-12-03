=begin
  given an array and value

  remove all occurances of value, and return new length

when a new

  [3, 3, 2, 3] val = 2
      w 
            r         

  if reader != val, place writer what reader reads
  advance both pointers

  if reader == val, advance reader

  when reader reaches the end of the array, pop off remaining elements from writer's location

  pop (length minus writer) times
  return writer index


  [0,1,3,0,4,0,4,2]   val = 2
             w
                 r  
=end

def remove_element(nums, val)
  writer = 0
  reader = 0

  while reader < nums.length
    if nums[reader] != val
      nums[writer] = nums[reader]
      writer += 1
    end

    reader += 1
  end

  writer
end

p remove_element([3,2,2,3], 3)
p remove_element([0,1,2,2,3,0,4,2], 2)
