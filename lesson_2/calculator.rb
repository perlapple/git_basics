# calculator

def prompt(message)
  puts "=> #{message}"
end

result = nil
number_1 = nil
number_2 = nil
name = nil
operation = nil

def operation_to_message(operation)
 case operation
 when '1'
   'Adding'
 when '2'
   'Substracting'
 when '3'
   'Multiplying'
 when '4'
   'Dividing'
 end
end

def valid_number?(number)
  number != 0
end

loop do
  prompt "Welcome to calculator. Enter your name:"
  name = gets.chomp.to_s

  if name.empty?
    prompt "Make sure you use a valid name."
  else
    break
  end
end

loop do # mail loop
  loop do
    prompt "Enter number 1:"
    number_1 = gets.chomp.to_i

    if valid_number?(number_1)
      break
    else
      prompt "Hmm, that's not a valid number"
    end

  end

  loop do
    prompt "Enter number 2:"
    number_2 = gets.chomp.to_i

    if valid_number?(number_2)
      break
    else
      prompt "Hmm, that's not a valid number"
    end

  end

  loop do
    prompt "Select operation to perform:\n 1. Add\n 2. Subtract\n 3. Multiply\n 4. Divide"
    operation = gets.chomp.to_s

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt "You must choose 1,2,3 or 4"
    end
  end

  prompt "#{operation_to_message(operation)} two numbers."

  result = case operation
    when '1'
      number_1 + number_2
    when '2'
      number_1 - number_2
    when '3'
      number_1 * number_2
    when '4'
      number_1 / number_2
  end

  prompt "The result is: #{result} "
  prompt "Do you want another operation? (Y to continue)"
  awnser = gets.chomp.to_s
  break unless awnser.downcase.start_with?('y')

end

prompt "Thank you #{name} for using calculator "
