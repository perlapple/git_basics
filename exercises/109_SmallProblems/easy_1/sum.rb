
def sum(digits)

  index = digits.to_s.size
  numbers = 0

  index.times { |i| numbers += digits.to_s[i].to_i }
  numbers

end
  #   number.to_s.chars.map(&:to_i).reduce(:+)


puts sum(23) #== 5
puts sum(496) #== 19
puts sum(123_456_789) #== 45
