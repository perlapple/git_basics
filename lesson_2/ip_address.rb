def is_an_ip_number?(word)
  word.to_i.between?(0, 255)
end

def contains_four_components?(word)
  input_string.split(".").count == 4
end

def dot_separated_ip_address?(ip_string)
  input_string.split(".").all?{ |number| is_an_ip_number?(number) }
end

def is_a_valid_ip?(ip_string)
  contains_four_components?(ip_string) && dot_separated_ip_address(ip_string)
  # dot_separated_ip_address(ip_string) if contains_four_components?
end

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   return false unless dot_separated_words.size == 4
#
#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     return false unless is_an_ip_number?(word)
#   end
#
#   true
# end

puts is_a_valid_ip?("1000.2.3.4")
