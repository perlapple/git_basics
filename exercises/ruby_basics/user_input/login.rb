PASSWORD = "Secret@2016"
USER = "garperl"

loop do
  puts ">> Please enter user name:"
  user_name = gets.chomp.to_s

  puts ">> Please enter your password:"
  user_password = gets.chomp.to_s

  break if user_password == PASSWORD && user_name = USER
  puts ">> Authorization failed!"
end

puts "Wellcome!"
