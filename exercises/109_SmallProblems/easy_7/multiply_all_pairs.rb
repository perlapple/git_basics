
def multiply_all_pairs(array1, array2)
  array1.product(array2).map { |numbers| numbers.inject(:*)}.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]
