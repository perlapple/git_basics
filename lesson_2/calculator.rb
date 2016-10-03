#calculator

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result
result = nil

puts "Enter number 1:"
number_1 = gets.chomp.to_i

puts "Enter number 2:"
number_2 = gets.chomp.to_i

puts "Select operation to perform:\n 1. Add\n 2. Subtract\n 3. Multiply\n 4. Divide"
operation = gets.chomp.to_s

if operation == '1'
  result = number_1 + number_2
elsif operation == '2'
  result = number_1 - number_2
elsif operation == '3'
  result = number_1 * number_2
elsif operation == '4'
  result = number_1 / number_2
else
  puts "Invalid selection."
end

puts result
