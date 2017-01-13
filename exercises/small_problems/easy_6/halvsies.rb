
def halvsies(array)
  first_half_length = (array.length / 2.0).round
  second_half_length = array.length / 2

  [array.first(first_half_length), array.last(second_half_length)]
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]
