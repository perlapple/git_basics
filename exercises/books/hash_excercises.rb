#Given a hash of family members, with keys as the title and an array of names as the values,
#use Ruby's built-in select method to gather only immediate family members' names into a new array.

# Given

# family = {  uncles: ["bob", "joe", "steve"],
#             sisters: ["jane", "jill", "beth"],
#             brothers: ["frank","rob","david"],
#             aunts: ["mary","sally","susan"]
#           }
#
#
# inmediate_family = family.select { |k,v| k == :sisters || k == :brothers }
#
# array = inmediate_family.values.flatten
# puts "#{array}"

# abc = { a: 100, b: 200, c: 300 }
#
# abc.each_key{ |key| p key }
# abc.each_value{ |values| p values }
# abc.each {|k,v| puts "key #{k} value #{v}"}
#

# person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
#
# puts person.fetch(:name)
# puts person[:name]

#What method could you use to find out if a Hash contains a specific value in it? Write a program to demonstrate this use.

# abc = { a: 100, b: 200, c: 300 }
#
# if abc.value?(1100)
#   puts "Hash contains value!!"
# else
#   puts "No value found!"
# end

#Write a program that prints out groups of words that are anagrams.
#Anagrams are words that have the same exact letters in them but in a different order.
#Your output should look something like this:



words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
