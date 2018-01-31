
def string_to_integer(string)
  number_map = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }
  integer = 0

   string.reverse.each_char.with_index(1) do |c, index|
      integer += (number_map[c] * (10 ** index))
   end

   integer / 10
end

puts string_to_integer('9876543210')
puts string_to_integer('43219') #== 4321
puts string_to_integer('570') #== 570
