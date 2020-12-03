=begin
  
input: string
output index of occurence of search term
  
get length of needle,

go through haystack, comparing substring of haystack to needle
=end

def str_str(haystack, needle)
  return 0 if needle.length == 0
  len = needle.length
  i = 0
  while i <= haystack.length - len
    return i if haystack[i, len] == needle
    i += 1
  end

  -1
end

p str_str('aaaaa', 'bba') # -1
p str_str('hello', 'll') # 2
p str_str('', 'hello') # 0
p str_str('hello world', ' ') # 5