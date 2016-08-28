# exercise 1. Ignoring Case

# name = 'Roger'
# puts name.upcase == 'RoGeR'.upcase

##########
# exercise 2. Dynamic String

# name = 'Elizabeth'
# puts "Hello, #{name}!"

##########
# exercise 3. Combining Names
# first_name = 'John'
# last_name = 'Doe'
# full_name = first_name + ' ' + last_name
# puts full_name

##########
# exercise  4. Tricky Formatting

# state = 'tExAs'
# state.upcase!
# puts state

# or
# state.capitalize!
# puts stat

##########
# exercise  5 Goqodbye, not Hello

# greeting = 'Hello!'
# greeting.gsub!('Hello', 'Goodbye')
# puts greeting

##########
# exercise. Print the Alphabet

# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# alphabet.each_char {|c| puts c }

##########
# exercise. Pluralize

# words = 'car human elephant airplane'
# words.each_line(' ') {|s| p s}

# or
# words.split(' ').each do |word|
#   puts word + 's'
# end


##########
# exercise. Are You There?

colors = 'blue pink yellow orange'

puts colors.include?('yellow')
puts colors.include?('purple')
