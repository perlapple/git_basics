#rock_paper_scissors.rb
VALID_CHOISES = ['rock', 'paper', 'scissors']
choice = nil

def test_method
  'test message'
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

puts test_method

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
        (player == 'scissors' && computer == 'paper')
    prompt('You won!')
  elsif (player == 'rock' && computer == 'paper') ||
          (player == 'paper' && computer == 'scissors') ||
            (player == 'scissors' && computer == 'rock')
      prompt('Computer won!')
  else
      prompt('It\'s a tie!')
  end
end

loop do
  loop do
    prompt("Chosse one: #{VALID_CHOISES.join(', ')}")
    choice = Kernel.gets().chomp()

    VALID_CHOISES.include?(choice) ? break : prompt('That is not a valid option')
  end

  computer_choice = VALID_CHOISES.sample
  puts "You chose: #{choice}: Computer chose: #{computer_choice} "
  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  awnser = gets.chomp
  break unless awnser.downcase.start_with?('y')
end
