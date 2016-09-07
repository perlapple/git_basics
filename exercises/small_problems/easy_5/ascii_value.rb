def ascii_value(string)
  string_value = 0

  string.each_char do |chr|
    string_value += chr.ord
  end

  string_value
end

puts ascii_value('Four score') ##== 984
puts ascii_value('Launch School') #== 1251
puts ascii_value('a') #== 97
puts ascii_value('') #== 0
