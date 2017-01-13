# calculator

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

puts MESSAGES.inspect

def prompt(message)
  puts "=> #{message}"
end

result = nil
number1 = nil
number2 = nil
name = nil
operation = nil

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  Float(input) rescue false
end

def interpolated_message(message_name, value)
  MESSAGES['es'][message_name].gsub("{var}", value)
end

def number2(operation)
  word  = case operation
          when '1'
            'Adding'
          when '2'
            'Substracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end
  word
end

def valid_number?(number)
  number.nonzero?
end

loop do
  prompt(MESSAGES['es']['welcome'])
  name = gets.chomp.to_s

  if name.empty?
    prompt 'Make sure you use a valid name.'
  else
    break
  end
end

loop do # mail loop
  loop do
    prompt(MESSAGES['es']['number_1'])
    number1 = gets.chomp.to_i

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['es']['not_valid_number'])
    end
  end

  loop do
    prompt(MESSAGES['es']['number_2'])
    number2 = gets.chomp.to_i

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['es']['not_valid_number'])
    end
  end

  loop do
    prompt(MESSAGES['es']['select_operation'])
    operation = gets.chomp.to_s

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt(MESSAGES['es']['reminder'])
    end

  end

  #prompt "#{number2(operation)} two numbers."
  prompt(interpolated_message("operation", number2(operation)))

  result = case operation
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1 / number2
           end

  prompt(interpolated_message("result", result.to_s))
  prompt(MESSAGES['es']['continue'])

  awnser = gets.chomp.to_s
  break unless awnser.downcase.start_with?('y') || awnser.downcase.start_with?('s')
end

prompt(interpolated_message("thanks", name))
