# @param {String} j
# @param {String} s
# @return {Integer}

# chars in j represent jewels, distinct

# chars in s represent stones, some of which may be jewels

# make a hash map of chars in j

# iterate through s, checking each char to see if it is hash map

def num_jewels_in_stones(j, s)
  jewel_hash = {}
  
  j.each_char do |char|
    next if jewel_hash[char]
    jewel_hash[char] = true
  end
  
  num_jewels = 0
  s.each_char do |char|
    num_jewels += 1 if jewel_hash[char]
  end
  
  num_jewels
end