
def string_to_integer(string)
  integer = 0
  numbers = {'0'=>0, '1'=> 1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9 }

  sign_number = sign(string[string.size])
  string.slice!(1) if string[1] == '-' || string[1] == '+'
  large = string.size

   string.each_char do |c|
    integer = integer + (numbers[c] * (large-1)**10)
   end
   integer * sign_number
end

def sign(char)
  sign_number = 0
  if char == '-'
    sign_number = -1
  else
    sign_number = 1
  end
  sign_number
end


puts string_to_integer('4321') #== 4321
puts string_to_integer('-570') #== -570
puts string_to_integer('+100') #== 100
