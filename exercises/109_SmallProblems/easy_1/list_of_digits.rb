
def digit_list(number)
  index = number.to_s.size
  numbers = Array.new
  index.times { |i| numbers << number.to_s[i].to_i }
  numbers
end

p digit_list(12345)
p digit_list(7)
p digit_list(375290)
p digit_list(444)
