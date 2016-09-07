
def running_total(array)
  elements = []
  sum = 0
  array.each do |value|
    elements << sum += value
  end
  elements
end

puts running_total([2, 5, 13]).inspect #== [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]).inspect #== [14, 25, 32, 47, 67]
puts running_total([3]).inspect #== [3]
puts running_total([]).inspect #== []
