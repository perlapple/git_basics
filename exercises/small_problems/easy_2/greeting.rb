
def greeting_a_user(name)
  if name.chars.last == '!'
    "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    "Hello #{name}"
  end
end

puts "What is your name?" #Bob
name = gets.chomp.to_s

puts greeting_a_user(name)
