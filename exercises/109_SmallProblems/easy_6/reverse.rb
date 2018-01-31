# Reversed arrayays

def reverse(original_array)
  reversed_array = original_array.clone

  reversed_array.first(reversed_array.length / 2).each_with_index do |element, index|
    inverse_index = (index + 1) * -1
    reversed_array[index], reversed_array[inverse_index] = reversed_array[inverse_index], reversed_array[index]
  end

  # while starts < ends do
  #   temp = array[starts]
  #   array[starts] = array[ends]
  #   array[ends] = temp
  #   starts += 1
  #   ends -= 1
  # end

  # while index < (array.length / 2) do
  #   inverse_index = array.length - index - 1
  #   temp = array[index]
  #   array[index] = array[inverse_index]
  #   array[inverse_index] = temp
  #   index += 1
  # end

  reversed_array
end

def reverse!(array)
  temp = 0;
  starts = 0
  ends = array.length - 1

  while starts < ends do
    temp = array[starts]
    array[starts] = array[ends]
    array[ends] = temp
    starts += 1
    ends -= 1
  end
  array
end

list = [1, 2, 3, 4]
result = reverse(list) # => [4,3,2,1]
p list
p result

# list = %w(a b c d e)
# reverse!(list) # => ["e", "d", "c", "b", "a"]
# p list
# p list.object_id
#
# list = ['abc']
# reverse!(list) # => ["abc"]
# p list
# p list.object_id
#
# list = []
# reverse!([]) # => []
# p list
# p list.object_id
