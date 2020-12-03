=begin
# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}

- looping naive problem

iteratate thru wordDict, if we find the word in s, remove it, repeat until s is empty
  - need nested loops to find multiple words?
  
find possible word lengths from wordDict
see if it is possible to break up s into those lengths (n1, n2, n3.. etc)
  - ['apple', 'pen'] => (5, 3)
  - examine first n chars from s
    'applepenapple'
    look at first three and five chars ('app' and 'apple', does it match anything in wordDict?, if so slice off
    'penapple', repeat the problem for this case
      
["cats", "dog", "sand", "and", "cat"] => 4, 3
    'catsandog'
    is cat or cats in the dict?
    cats is found, return 'andog'
      - 'and' is found, return 'og'
        - 'og' is not found, return false
      
    repeat with cat
      return 'sandog'
        -search for 'sand or san', 'sand' is found, return 'og'
          - 'og' is not found, return false

'catsandog'
    p
          
hash wordDict and lengths to speed lookup

"cars", 

["car","ca","rs"]

c a r s
      p
=end
  


# require 'pry'
  
def word_break(s, word_dict)
  dictionary, word_lengths = parse_dict(word_dict)
  word_break_helper(s, dictionary, word_lengths, 0, {})
end

def word_break_helper(s, dictionary, word_lengths, p, cache)
  #base case, p = s.length
  if p >= s.length
    return true
  end

  # iterate over word lengths
  # check if each slice is in dictionary,
  # if it is, recursively call with p += word.length
  
  word_lengths.each do |len|
    slice = s[p, len]

    # if we find the word
    if dictionary[slice]
      
      # check if cache exists after moving pointer past found word
      if cache[p + len] != nil
        # if it does, grab it
        result = cache[p + len]
      else
        # if not, recursively call function and cache it
        result = word_break_helper(s, dictionary, word_lengths, p + len, cache)
        cache[p + len] = result
      end

      # early return if result is true, otherwise reset p
      return result if result
    end
  end

  # we didn't find any more words in recursive calls
  # cache and return this result
  cache[p] = false
end

def parse_dict(words)
  dict = {}
  counts = {}

  words.each do |word|
    dict[word] = true
    !counts[word.length] && counts[word.length] = true
  end

  [dict, counts.keys]
end

wordDict = ["cats", "dog", "sand", "and", "cat"]

p word_break("abcd", ["a","abc","b","cd"]) # true
p word_break('catsandog', wordDict)        # false
p word_break('leetcode', ['leet', 'code']) # true
p word_break("cars", ["car","ca","rs"])    # true