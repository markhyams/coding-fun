def can_place_flowers(flowerbed, n)
  return true if n == 0
  bed = flowerbed.clone
  i = 0
  num_flowers = 0
  
  while i < bed.length
    if i == 0 
      if bed[0, 2].all? { |i| i == 0 }
        bed[i] = 1
        num_flowers += 1
        return true if num_flowers == n
      end
    elsif bed[i- 1, 3].all? { |i| i == 0 }
      bed[i] = 1
      num_flowers += 1
      return true if num_flowers == n
    end
    
    i += 1
  end
  p num_flowers
  
  num_flowers >= n
end