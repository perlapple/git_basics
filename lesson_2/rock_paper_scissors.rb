# rock_paper_scissors.rb

VALID_CHOISES = %w(rock paper scissors spock lizard).freeze
choice = nil

def test_method
  'test message'
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt('It\'s a tie!')
  end
end

loop do
  loop do
    prompt("Chosse one: #{VALID_CHOISES.join(', ')}")
    choice = gets.chomp

    VALID_CHOISES.include?(choice) ? break : prompt('Thats not a valid option')
  end

  computer_choice = VALID_CHOISES.sample
  puts "You chose: #{choice}: Computer chose: #{computer_choice} "
  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  awnser = gets.chomp
  break unless awnser.downcase.start_with?('y')
end
