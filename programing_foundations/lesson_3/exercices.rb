# statement = "The Flintstones Rock"
# occurrences = Hash.new(0)
#
# statement.each_char { |chr| occurrences[chr] += 1 if chr.match(/^[[:alpha:]]$/)}
# puts occurrences
#
# ##########################
# @limit = 15
#
# def fib(first_num, second_num)
#   while second_num < @limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end
#
# result = fib(0, 1)
# puts "result is #{result}"
#
# ##########################


# def titleize(sentence)
#   sentence.split.map { |word| word.capitalize }.join(' ')
# end
#
# sentence = "the kid in the jungle"
# puts titleize(sentence)
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.each do |name, details|
#   puts "#{name} is a #{details["age"]} year old #{details["gender"]}"
# end

# members_age = 0
# munsters.each_value{ |value| members_age += value["age"] if value["gender"] == "male"}
# puts members_age

# munsters.each do |name, details|
#   case details["age"]
#   when 0...18
#     details["age_group"] = "kid"
#   when 18...65
#     details["age_group"] = "adult"
#   else
#     details["age_group"] = "senior"
#   end
# end
#
# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param << "rutabaga"
#
#   return a_string_param, an_array_param
# end
#
#
# my_string = "pumpkins"
# my_array = ["pumpkins"]
# my_string, my_array = tricky_method(my_string, my_array)
#
# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"


# sentence = "Humpty Dumpty sat on a wall."
# backwards_sentence = sentence.split(/\W/).reverse.join(' ') + '.'
#
# sentence = "Humpty Dumpty sat on a wall."
# words = sentence.split(/\W/)
# words.reverse!
# backwards_sentence = words.join(' ') + '.'



munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

musters_string = "perla"

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

def musters_string(munster)
  munster.upcase!
end

mess_with_demographics(munsters)
musters_string(musters_string)

puts munsters
puts musters_string
