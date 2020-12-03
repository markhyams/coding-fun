require 'pry'

def path_helper(col, row)
  cache = {}
  
  row_ptr = 1
  
  while row_ptr <= row
    col_ptr = 1
    while col_ptr <= col
      if col_ptr == 1 || row_ptr == 1
        cache[[col_ptr, row_ptr]] = 1
      else   
        cache[[col_ptr, row_ptr]] = cache[[col_ptr - 1, row_ptr]] + cache[[col_ptr, row_ptr - 1]]
      end
      col_ptr += 1
    end
    row_ptr += 1
  end
  cache[[col, row]]
end

p path_helper(8, 2)