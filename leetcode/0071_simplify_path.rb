=begin
# -> LIFO -> Stack

# "/a   /. /b  /..  /..  /c  /"  => '/c'

# ['/c, '/'] => '/c'

# '/../' => '/'

# - '/' are the delimiters (or end of the string)
# - if we meet a normal path '/a' -> push to stack
# - if we meet a '/.' || '/' -> we just keep going
# - if we meet a '/..' -> we pop the stack and keep going

# '/'

# '/..'

# "/c"
"/a/./b/../../c/"
 
=end

def simplify_path(path) 
  path = path + '/'
  split_path = []
  token = ''
  
  path.chars.each do |char|
    if char == '/'
      split_path << token
      token = '/'
    else
      token += char
    end
  end

  result = []
  
  split_path.each do |str|
    if str == '' || str == '/.' || str == '/'
      next
    elsif str == '/..'
      result.pop
    else
      result.push(str)
    end
  end
  
  result = result.join
  return "/" if result == ""
  result
end

p simplify_path("/a/./b/../../c/") # /c
p simplify_path("/a//b////c/d//././/..") # /a/b/c
p simplify_path("/a//b////c/d//././/..") # /a/b/c