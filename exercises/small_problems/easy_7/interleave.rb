
def interleave(array1, array2)
  interleave_array = []
  array1.each.with_index do |value, index|
    interleave_array << value << array2[index]
  end

  interleave_array
end

def interleave_zip(array1, array2)
  array1.zip(array2).flatten
end

p interleave_zip([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']
