=begin
binary search
two pointers upper, and lower

[1, 2, 13, 14, 25, 63, 71, 88, 89]
                               l 
                               u
                               m
                89
=end

def binary_search(arr, target)
  left = 0
  right = arr.length - 1

  while right >= left
    middle = (left + right) / 2

    return middle if arr[middle] == target

    if target < arr[middle]
      right = middle - 1
    else
      left = middle + 1
    end
  end

  nil
end

p binary_search([0, 1, 2], 2) # 2
p binary_search((1..9).to_a, 5) # 4
p binary_search((1..9).to_a, 10) # nil
p binary_search((1..9).to_a, 9) # 8
p binary_search([1, 2, 13, 14, 25, 63, 71, 88, 89], 89) # 8
p binary_search([1, 2, 13, 14, 25, 63, 71, 88, 89], 80) # nil
