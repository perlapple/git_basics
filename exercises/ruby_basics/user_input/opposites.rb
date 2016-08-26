#opposites.rb

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def ask_integer
  puts ">> Please enter a positive or negative integer:"
  gets.chomp.to_i
end

def is_one_number_negative?(number1, number2)
  number1 < 0 && number2 > 0 || number1 > 0 && number2 < 0
end


def obtain_number
  number = nil

  loop do
    number = ask_integer

    if valid_number?(number)
      puts "Invalid input. Only non-zero integers are allowed."
    else
      break
    end
  end

  number
end

loop do

  number1 = obtain_number
  number2 = obtain_number

  if is_one_number_negative?(number1, number2)
    puts "#{number1} + #{number2} = #{number1 + number2}"
    break
  else
    puts "Please start over."
  end

end
