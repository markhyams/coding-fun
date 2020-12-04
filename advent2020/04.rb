# require 'pry'

passports = ""
File.open('04.txt', 'r') do |f|
  f.each_line do |line|
    passports += line
  end
end



parsed_passports = passports.split(/\n\n/).map { |str| str.gsub(/\n/, ' ')}

def count_valid(passports)
  result = 0
  passports.each do |passport|
    if valid?(passport)
      result += 1 
      # p passport
    end
  end

  result
end

def valid?(record)
  fields = record.split
  return false if fields.length <=6

  obj = {}
  fields.each do |field|
    key, value = field.split(':')
    # return false if key == 'cid' && fields.length == 7

    obj[key] = value
  end
  
  valid_extra?(obj)
end

def valid_extra?(obj)
  return false unless valid_birth_year?(obj["byr"].to_i)
  return false unless valid_issue_year?(obj["iyr"].to_i)
  return false unless valid_exp_year?(obj["eyr"].to_i)
  return false unless valid_height?(obj["hgt"])
  return false unless valid_hair_color?(obj["hcl"])
  return false unless valid_eye_color?(obj["ecl"])
  return false unless valid_passport_id?(obj["pid"])
  true
end

def valid_birth_year?(year)
  return false unless year
  # year >= 1920 && year <= 2002
  between(year, 1920, 2002)
end

def valid_issue_year?(year)
  return false unless year
  # year >= 2010 && year <= 2020
  between(year, 2010, 2020)
end

def valid_exp_year?(year)
  return false unless year
  # year >= 2020 && year <= 2030
  between(year, 2020, 2030)
end

def valid_height?(height)
  return false unless height
  units = height[-2, 2]
  num = height.gsub(/cm|in/, '').to_i
  if units == 'cm'
    return between(num, 150, 193)
  elsif units == 'in'
    return between(num, 59, 76)
  end
  false
end

def valid_hair_color?(hair)
  return false unless hair
  hair.match?(/#[0-9a-f]{6}/)
end

def valid_eye_color?(eye)
  return false unless eye
  %w(amb blu brn gry grn hzl oth).count(eye) == 1
end

def valid_passport_id?(pid_str)
  return false unless pid_str
  pid_str.match?(/^[0-9]{9}$/)
end

def between(num, lower, upper)
  num >= lower && num <= upper
end
  
p valid?("cid:271 pid:#4b8380 hcl:80fab0 byr:2024 ecl:#20e25f iyr:1945 eyr:1935 hgt:159cm") == false
p valid?("eyr:1972 cid:100 hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926") == false
p valid?("iyr:2019 hcl:#602927 eyr:1967 hgt:170cm ecl:grn pid:012533040 byr:1946") == false
p valid?("hcl:dab227 iyr:2012 ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277") == false
p valid?("hgt:59cm ecl:zzz eyr:2038 hcl:74454a iyr:2023 pid:3556412378 byr:2007") == false


p valid?("pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980 hcl:#623a2f") == true
p valid?("eyr:2029 ecl:blu cid:129 byr:1989 iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm") == true
p valid?("hcl:#888785 hgt:164cm byr:2001 iyr:2015 cid:88 pid:545766238 ecl:hzl eyr:2022") == true
p valid?("iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719") == true
p valid_height?("159cm") == true
p valid_height?("159") == false
p valid_height?("60in") == true

# byr valid:   
p valid_birth_year?(2002) == true

# byr invalid: 2003
p valid_birth_year?(2003) == false

# hgt valid:   60in
p valid_height?("60in") == true

# hgt valid:   190cm
p valid_height?("190cm") == true

# hgt invalid: 190in
p valid_height?("190in") == false

# hgt invalid: 190
p valid_height?("190") == false

# hcl valid:   #123abc
p valid_hair_color?("#123abc") == true

# hcl invalid: #123abz
p valid_hair_color?("#123abz") == false

# hcl invalid: 123abc
p valid_hair_color?("123abc") == false

# ecl valid:   brn
p valid_eye_color?("brn") == true

# ecl invalid: wat
p valid_eye_color?("wat") == false

# pid valid:   000000001
p valid_passport_id?("000000001") == true

# pid invalid: 0123456789
p valid_passport_id?("0123456789") == false
  
p count_valid(parsed_passports)
