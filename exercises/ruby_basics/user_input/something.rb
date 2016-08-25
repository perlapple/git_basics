puts ">> Do you want me to print something? (y/n)"
response = gets.chomp.to_s

puts "Hello there!" if response == "y"
