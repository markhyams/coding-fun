def count_bits(num)
  result = []
  (0..num).each do |int|
    bin = int.to_s(2)
    count = bin.split('').count { |n| n == "1" }
    puts "#{bin}, #{count}"
  end
  result
end

p count_bits(50)

