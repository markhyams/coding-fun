def roman_to_int(str)
  roman = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  nums = str.split('').map { |char| roman[char] }
  total = 0

  i = 0
  while i < nums.length
    # check if next num is smaller than current num
    # if so, add difference to total, advance two numbers
    # if not, add number to total
    if nums[i + 1] && nums[i] < nums[i + 1]
      num_to_add = nums[i + 1] - nums[i]
      total += num_to_add
      i += 1
    else 
      total += nums[i]
    end
    i += 1
  end

  total
end

p roman_to_int('III')
p roman_to_int('IV')
p roman_to_int('IX')
p roman_to_int('LVIII') # 58
p roman_to_int('MCMXCIV') # 1994
