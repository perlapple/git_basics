
numbers = []
%w(1st 2nd 3rd 4th 5th last).each do |index|
  puts "Enter the #{index} number:"
  numbers << gets.chomp.to_i
end

last_number = numbers.pop

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appears in #{numbers}."
end
