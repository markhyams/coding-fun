# FBFBBFFRLR reveals that it is the seat at row 44, column 5.
# BFFFBBFRRR: row 70, column 7, seat ID 567.
# FFFBBBFRRR: row 14, column 7, seat ID 119.
# BBFFBBFRLL: row 102, column 4, seat ID 820.

# F is 0
# B is 1
# R is 1
# L is 0

seats = []
File.open('05.txt', 'r') do |f|
  f.each_line do |line|
    seats << line
  end
end

def all_seat_ids(seats)
  seats.map do |seat|
    row = fb_to_int(seat.slice(0, 7))
    col = rl_to_int(seat.slice(7, 3))
    row * 8 + col
  end
end

def fb_to_int(str)
  str.gsub('F', '0').gsub('B', '1').to_i(2)
end

def rl_to_int(str)
  str.gsub('R', '1').gsub('L', '0').to_i(2)
end

def my_seat(seats)
  sorted_seat_ids = all_seat_ids(seats).sort
  # iterate through all seat ids
  # two pointers, prev and current
  # if the current = prev + 1, keep going
  # if current = prev + 2, return prev + 1
  i = 1

  while  i < sorted_seat_ids.length
    prev = sorted_seat_ids[i - 1]
    current = sorted_seat_ids[i]

    if current - prev == 2
      return prev + 1
    end

    i += 1
  end
end



p fb_to_int("FBFBBFF") == 44 # reveals that it is the seat at row 44, column 5.
p fb_to_int("BFFFBBF") == 70 #: row 70, column 7, seat ID 567.
p fb_to_int("FFFBBBF") == 14 #: row 14, column 7, seat ID 119.
p fb_to_int("BBFFBBF") == 102 #:

p rl_to_int("RLR") == 5 #  reveals that it is the seat at row 44, column 5.
p rl_to_int("RRR") == 7 # : row 70, column 7, seat ID 567.
p rl_to_int("RRR") == 7 # : row 14, column 7, seat ID 119.
p rl_to_int("RLL") == 4 # :

all_seats = all_seat_ids(seats).sort
p all_seats.last == 888

p my_seat(seats) == 522