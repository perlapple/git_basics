
def string_to_integer(string)
  integer = 0
  number_map = {'0'=>0, '1'=> 1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9 }

  sign_number = sign(string[0])
  string.slice!(0) if string[0] == '-' || string[0] == '+'

  string.reverse.each_char.with_index(1) do |c, index|
     integer += (number_map[c] * (10 ** index))
  end

  integer /10 * sign_number
end

def sign(char)
  sign_number = 0
  if char == '-'
    sign_number = -1
  else
    sign_number = 1
  end
end


puts string_to_integer('4321') #== 4321
puts string_to_integer('-570') #== -570
puts string_to_integer('+100') #== 100
