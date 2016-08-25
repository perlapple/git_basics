PASSWORD = "Secret@2016"

loop do
  puts ">> Please enter your password:"
  user_password = gets.chomp.to_s

  break if user_password == PASSWORD
  puts ">> Invalid password!"
end

puts "Wellcome!"
