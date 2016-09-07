
def multisum(number)
  multiples = []


  number.times do |index|
    value_to_compare = index + 1
    if value_to_compare % 3 == 0 || value_to_compare % 5 == 0
      multiples << value_to_compare
    end
  end

  sum = 0
  multiples.each { |number| sum += number }
  sum
end

puts multisum(1) #== 0
puts multisum(3) #== 3
puts multisum(5) #== 8
puts multisum(10) #== 33
puts multisum(1000) #== 234168
