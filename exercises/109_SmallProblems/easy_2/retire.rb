
puts "What is your age?" #30
age = gets.chomp.to_i

puts "At what age would you like to retire?" #70
age_to_retire = gets.chomp.to_i


current_year = Time.now.year

rest = age_to_retire - age
year_to_retire = current_year + rest


puts "It's #{current_year}. You will retire in #{year_to_retire}"
puts "You have only #{rest} years of work to go!"
