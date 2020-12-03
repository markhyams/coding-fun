=begin
reverse a string in place, do not allocate extra memory

[ 1, 2, 3, 4, 5, 6 ]
        l
           f
  
  start, end pointers
  swap, move in


when last <= first, stop


=end

def reverse_string(chars)
  first = 0
  last = chars.length - 1
  
  while last > first
    chars[first], chars[last] = chars[last], chars[first]
    first += 1
    last -= 1
  end

  chars
end

p reverse_string('hello'.split(''))
p reverse_string('everybody loves ruby'.split(''))