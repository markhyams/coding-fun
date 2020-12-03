=begin
IPv4
- 4 numbers
- dot separated
- ranging from 0-255
- no leading zeros

IPv6
- 8 groups
- colon separated
- each group must be between 1-4 chars (no empty group)
- each digit must be a valid hexadecimal
- 
=end

def valid_ip_address(ip)
  return "IPv4" if valid_ipv4?(ip)
  return "IPv6" if valid_ipv6?(ip)
  "Neither"
end

def valid_ipv4?(ip)
  groups = ip.split('.')
  return false unless groups.join('.') == ip
  return false unless groups.length == 4
  groups.each do |group|
    return false unless ipv4_group_valid?(group)
  end

  true
end

def ipv4_group_valid?(group)
  int = group.to_i
  return false unless group == int.to_s
  int >= 0 && int <= 255
end

def valid_ipv6?(ip)
  groups = ip.split(':')
  return false unless groups.join(':') == ip
  return false unless groups.length == 8

  groups.each do |group|
    return false unless ipv6_group_valid?(group)
  end

  true
end

def ipv6_group_valid?(group)
  return false if group.length < 1 || group.length > 4
  return false unless valid_hex?(group)
  true
end

def valid_hex?(group)
  group.each_char do |char|
    return false unless char.upcase.match(/[0-9ABCDEF]/)
  end
end

p valid_ip_address('172.16.254.1')  # IPv4
p valid_ip_address('172.06.231.0')  # Neither
p valid_ip_address('0.0.0.0') # IPv4
p valid_ip_address('256.1.1.1') # Neither
p valid_ip_address('255.1.1') # Neither

p valid_ip_address('02001:0db8:85a3:0000:0000:8a2e:0370:7334') # Neither
p valid_ip_address('2001:0db8:85a3:0000:0000:8a2e:0370:7334') # IPv6
p valid_ip_address('2001:db8:85a3:0:0:8A2E:0370:7334') # IPv6
p valid_ip_address('2001:0db8:85a3::8A2E:0370:7334') # Neither
p valid_ip_address('2001:qzb8:85a3:abcd:8A2E:abcd:0370:7334') # Neither
p valid_ip_address('2001:0db8:85a3:0:0:8A2E:0370:7334:') # Neither
p valid_ip_address("20EE:FGb8:85a3:0:0:8A2E:0370:7334") # Neither
