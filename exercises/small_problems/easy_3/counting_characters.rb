puts "Please write word or multiple words:"
words = gets.chomp.to_s

puts "There are #{words.delete(' ').size} characters in #{words}"
