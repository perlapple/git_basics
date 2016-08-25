# 1. The code below is an example of an infinite loop. The name describes exactly what it does: loop infinitely. This loop isn't useful in a real program, though. Modify the code so the loop stops after the first iteration.

# loop do
#   puts 'Just keep printing...'
#   break
# end

# 2. The code below is an example of a nested loop. Both loops currently loop infinitely. Modify the code so each loop stops after the first iteration.

# loop do
#   puts 'This is the outer loop.'
#
#   loop do
#     puts 'This is the inner loop.'
#     break
#   end
#   break
# end
#
# puts 'This is outside all loops.'


# 3. Modify the following loop so it iterates 5 times instead of just once.

# iterations = 1
#
# loop do
#   puts "Number of iterations = #{iterations}"
#   break if iterations == 5
#   iterations += 1
# end

# 4. Modify the code below so the loop stops iterating when the user inputs 'yes'.

# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break if answer == "yes"
# end
#


# 5. Modify the code below so "Hello!" is printed 5 times.

# say_hello = true
# iterations = 1
#
# while say_hello
#   puts 'Hello!'
#   if iterations == 5
#     say_hello = false
#   end
#   iterations += 1
# end
#


# 6. Using a while loop, print 5 random numbers between 0 and 99. The code below shows an example of how to begin solving this exercise.

# numbers = [100,21,32,34,45]
# count = 0
#
# while count < 5
#   puts "number: #{numbers[count]}"
#   count += 1
# end

# numbers = []
#
# while numbers.size < 5
#   numbers << rand(100)
# end
#
# puts numbers



# 7. The following code outputs a countdown from 10 to 1. Modify the code so that it counts from 1 to 10 instead.
#
# count = 1
#
# until count > 10
#   puts count
#   count += 1
# end



# 8. Given the array of several numbers below, use an until loop to print each number.

# numbers = [7, 9, 13, 25, 18]
# count = 0
#
# until count == numbers.size
#   puts "#{numbers[count]}"
#   count += 1
# end
#
#



# 9. The code below shows an example of a for loop. Modify the code so that it only outputs i if i is an odd number.

# for i in 1..100
#   puts i if i.odd?
# end



# 10. Your friends just showed up! Given the following array of names, use a for loop to greet each friend individually.

# friends = ['Sarah', 'John', 'Hannah', 'Dave']
# count = 0
#
# until count == friends.size
#   puts "Hello, #{friends[count]}!"
#   count += 1
# end

# friends = ['Sarah', 'John', 'Hannah', 'Dave']
#
# for friend in friends
#   puts "Hello, #{friend}!"
# end



# 11. Write a loop that prints numbers 0-5 and whether the number is even or odd. Use the code below to get started.

# count = 1
#
# loop do
#
#   if count.odd?
#     puts "#{count} is odd"
#   else
#     puts "#{count} is even"
#   end
#   break if count == 5
#   count += 1
# end


#Modify the following code so that the loop stops if number is between 0 and 10.

# loop do
#   number = rand(100)
#   puts number
#   break if number < 10
# end

#Using an if/else statement, run a loop that prints "The loop was processed!" one time if process_the_loop equals true.
#Print "The loop wasn't processed!" if process_the_loop equals false.

# process_the_loop = [true, false].sample
#
# if process_the_loop == true
#   loop do
#     puts "The loop was processed!"
#     break
#   end
# else
#   puts "The loop wasn't processed!"
# end


# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#
#   if answer == 4
#     puts "That's correct!"
#     break
#   else
#     puts "Wrong answer. Try again!"
#   end
# end



# Modify the code below so that the user's input gets added to the numbers array. Stop the loop when the array contains 5 numbers

# numbers = []
#
# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers << input
#   break if numbers.size == 5
# end
# puts numbers


#Given the array below, use loop to remove and print each name. Stop the loop once names doesn't contain any more elements.

# names = ['Sally', 'Joe', 'Lisa', 'Henry']
#
# loop do
#   puts names.pop
#   break if names.size == 0
# end


# The method below counts from 0 to 4. Modify the block so that it prints the current number and stops iterating when the current number equals 2.

# 5.times do |index|
#   puts index
#   break if index == 2
# end
#
# Using next, modify the code below so that it only prints even numbers.

 #number = 0

 # until number == 10
 #   number += 1
 #   next unless number.even?
 #    puts number
 # end
#
# number = 0
#
# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end

##################
# number_a = 0
# number_b = 0
#
# loop do
#   puts number_a += rand(2)
#   puts number_b += rand(2)
#
#   next unless (number_a == 5 || number_b == 5)
#
#   puts "5 was reached!"
#   break
# end


#Given the code below, use a while loop to print "Hello!" twice.

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting()
  number_of_greetings -= 1
end
