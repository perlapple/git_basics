
# object-oriented number guessing class for numbers in a range.
class GuessingGame
  def initialize(low_value, high_value)
    @low_value = low_value
    @high_value = high_value
  end

  def play
    reset_game

    until @guesses_per_game <= 0
      puts "\nYou have #{@guesses_per_game} guesses remaining."
      guess_from_user
      calculate_game
    end
    puts 'You are out of guesses. You lose.' if @guesses_per_game.zero?
  end

  private

  def calculate_game
    if same_numbers?
      puts 'You win!'
      @guesses_per_game = -1
    else
      print hint
      @guesses_per_game -= 1
    end
  end

  def same_numbers?
    @guessed_number == @random_number
  end

  def reset_game
    @random_number = calculate_random_number
    @guesses_per_game = calculate_guesses_per_game
  end

  def calculate_random_number
    rand(@low_value..@high_value)
  end

  def size_of_range
    @high_value - @low_value
  end

  def calculate_guesses_per_game
    Math.log2(size_of_range).to_i + 1
  end

  def hint
    if @guessed_number < @random_number
      puts 'Your guess is too low.'
    else
      puts 'Your guess is too high'
    end
  end

  def guess_from_user
    loop do
      print "Enter a number between #{@low_value} and #{@high_value}: "
      @guessed_number = gets.chomp.to_i
      break if @guessed_number.between?(@low_value, @high_value)
      puts 'Invalid guess. '
    end

    @guessed_number
  end
end

# game = GuessingGame.new
# game.play
# game.play

game = GuessingGame.new(1, 10)
game.play
