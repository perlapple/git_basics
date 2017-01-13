# rock_paper_scissors.rb

RULES = {
  'rock'      => %w(scissors lizard),
  'paper'     => %w(rock spock),
  'scissors'  => %w(paper lizard),
  'spock'     => %w(rock scissors),
  'lizard'    => %w(spock paper)
}.freeze

VALID_CHOICES = RULES.keys.freeze
OPTION_MSG = '(select more than two letters for spock and scissors)'

def prompt(message)
  Kernel.puts("=> #{message}")
end

def choice_from_input(input)
  VALID_CHOICES.select { |opt| opt.downcase.start_with?(input.downcase) }.first
end

def win?(first, second)
  first = choice_from_input(first)
  second = choice_from_input(second)

  RULES[first].include?(second)
end

def calculate_score(winner)
  @score[winner] += 1
end

def display_results(player, computer)
  if win?(player, computer)
    calculate_score('player')
    prompt('You won!')
  elsif win?(computer, player)
    calculate_score('computer')
    prompt('Computer won!')
  else
    prompt('It\'s a tie!')
  end
end

def valid?(choice)
  VALID_CHOICES.count { |opt| opt.downcase.start_with?(choice.downcase) } == 1
end

def get_option_from_user
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    valid?(choice) ? break : prompt("That\'s not a valid option. #{OPTION_MSG}")
  end
  choice
end

def reset_score
  @score = {
    'player' => 0,
    'computer' => 0
  }
end

def match_winner
  @score.key(5)
end

loop do
  reset_score
  loop do
    user_choice = get_option_from_user
    computer_choice = VALID_CHOICES.sample

    puts "You chose: #{user_choice}: Computer chose: #{computer_choice} "
    display_results(user_choice, computer_choice)
    #puts "Score: #{@score}"

    if match_winner
      puts "Score: #{@score}... The winner is: #{match_winner}"
      break
    end
  end

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
