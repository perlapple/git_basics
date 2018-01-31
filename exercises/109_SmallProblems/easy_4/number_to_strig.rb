
def integer_to_string(integer)

  string = ''

  if integer < 0 then string = '-' << convert(integer * -1)
  elsif integer == 0 then string = '0'
  else string = '+' << convert(integer)
  end

  string
end

def convert(integer)
  array = %w(0 1 2 3 4 5 6 7 8 9)
  string = ''
  while integer > 0
    string.prepend(array[integer % 10])
    integer /= 10
  end
  string
end

puts integer_to_string(+4321).inspect #== '4321'
puts integer_to_string(-120).inspect #== '0'
puts integer_to_string(0).inspect #== '5000'
