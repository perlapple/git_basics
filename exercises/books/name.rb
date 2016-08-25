
# Write a program called name.rb that asks the user to type in their name
#and then prints out a greeting message with their name included.

# puts "Write your name:"
# name = gets.chomp
# puts "Thank you " + name + "!"


#Write a program called age.rb that asks a user how old they are
#and then tells them how old they will be in 10, 20, 30 and 40 years.
#Below is the output for someone 20 years old.


# puts "What is your age?"
# age = gets.chomp.to_i
#
# puts "In 10 years you will be: #{(age + 10)}"
# puts "In 10 years you will be: " + (age + 20).to_s
# puts "In 10 years you will be: " + (age + 30).to_s
# puts "In 10 years you will be: " + (age + 40).to_s
# puts "In 10 years you will be: " + (age + 30).to_s

#Add another section onto name.rb that prints the name of the user 10 times.
#You must do this without explicitly writing the puts method 10 times in a row.
#Hint: you can use the times method to do something repeatedly.

#  puts "What is your name?"
#  name = gets.chomp
#  #puts name * 10
#
# 10.times do
#   puts name
# end

#Modify name.rb again so that it first asks the user for their first name,
#saves it into a variable, and then does the same for the last name. Then outputs their full name all at once.

puts "What is your first name?"
first_name = gets.chomp

puts "What is your last name?"
last_name = gets.chomp

puts "Hello " + first_name + " " + last_name
