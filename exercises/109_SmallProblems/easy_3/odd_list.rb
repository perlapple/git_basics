
def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
oddities(['abc', 'def']) #== ['abc']
oddities([123]) #== [123]
oddities([]) #== []
