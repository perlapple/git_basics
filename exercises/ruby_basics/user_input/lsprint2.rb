
def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def quit?(choice)
  choice == 'q' || choice == 'Q'
end

def enough_lines?(number_of_lines)
  number_of_lines < 3
end

def print_lines(number_of_lines)
  for i in 1..number_of_lines do
    puts "Launch School is the best!"
  end
end

loop do
  puts '>> How many output lines do you want? Enter a number >= 3: (q to quit)'
  choice = gets.chomp.to_s

  if valid_number?(choice)
    choice = choice.to_i
    if enough_lines?(choice)
      puts ">> That's not enough lines."
    else
      print_lines(choice)
    end
  elsif quit?(choice)
      break
  end
end
