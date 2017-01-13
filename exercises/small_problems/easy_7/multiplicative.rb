
def show_multiplicative_average(numbers)
  product = 1
  numbers.each do |num|
    product *= num
  end
  (product.to_f / numbers.length).round(3)
end

p show_multiplicative_average([3, 5])
#The result is 7.500

p show_multiplicative_average([2, 5, 7, 11, 13, 17])
#The result is 28361.667
