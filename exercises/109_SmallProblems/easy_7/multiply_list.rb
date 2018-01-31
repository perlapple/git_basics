
def multiply_list(array1, array2)
  array1.map.with_index do |num, index|
     array2[index] * num
  end
end

def multiply_list_one_line(array1, array2)
  array1.zip(array2).map { |numbers| numbers.inject(:*)}
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
p multiply_list_one_line([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
