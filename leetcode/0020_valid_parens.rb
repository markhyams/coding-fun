def is_valid(s)
  map = {
    '{' => '}',
    '[' => ']',
    '(' => ')'
  }
  
  stack = []
  
  # itearte through chars of s
  s.each_char do |char|
    if map[char] # its an opening paren
      stack.push(char)
    else # its a closing paren
      # if last item is the opening version, pop it off, otherwise return false
      if char == map[stack.last]
        stack.pop
      else
        return false
      end
    end
  end
    
  stack.empty?
end