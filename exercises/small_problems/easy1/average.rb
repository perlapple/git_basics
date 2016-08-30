
def average(numbers)

  average_numbers = 0

  numbers.each do |number|
    average_numbers += number
  end

  average_numbers/numbers.size
end

puts average([1, 5, 87, 45, 8, 8])  #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40
