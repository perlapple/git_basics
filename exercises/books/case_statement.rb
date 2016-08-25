# #case_statement.rb <-- refactored
#
# a = 5
#
# answer = case a
#   when 5
#     "a is 5"
#   when 6
#     "a is 6"
#   else
#     "a is neither 5, nor 6"
#   end
#
# puts answer
#
# a = 5
# if a
#   puts "how can this be true?"
# else
#   puts "it is not true"
# end

#Write a method that takes a string as argument.
#The method should return the all-caps version of the string, only if the string is longer than 10 characters.
#Example: change "hello world" to "HELLO WORLD". (Hint: Ruby's String class has a few methods that would be helpful. Check the Ruby Docs!)

# def all_caps(word)
#   if word.length >= 10
#     word = word.upcase
#   else
#     word
#   end
# end
#
# p all_caps("Hello")
# p all_caps("Hello World!!")

#Write a program that takes a number from the user between 0 and 100 and
#reports back whether the number is between 0 and 50, 51 and 100, or above 100

puts "Please enter a number between 0 and 100."
number = gets.chomp.to_i

result = case
  when number < 0
    "You can't enter negative number!"
  when number <= 50
    "number is between 0 and 50"
  when number <= 100
    "number is between 51 and 100"
  else
    "number is above 100"
  end

puts result
