
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],

  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],

  [0, 4, 8],
  [2, 4, 6]
].freeze

def reset_score
  @score = {
    'player' => 0,
    'computer' => 0
  }
end

def reset_board
  @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]}"
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]}"
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]}"
end

def a_valid_position?(position)
  position.to_s.to_i == position && position.between?(1, 9) && @board[position - 1] == ' '
end

def find_at_risk_square
  square_at_risk = nil

  WIN_COMBINATIONS.each do |line|
    next unless @board.values_at(*line).count('O') == 2
    @board.each_with_index do |mark, index|
      square_at_risk = index if line.include?(index) && mark == ' '
    end
  end

  square_at_risk
end

def obtain_machine_position
  posibilities = []

  square = find_at_risk_square

  unless square
    @board.each_with_index do |value, position|
      posibilities << position if value == ' '
    end
    square = posibilities.sample
  end

  square
end

def user_mark(position)
  @board[position] = 'O'
end

def machine_mark(position)
  @board[position] = 'X'
end

def board_full?
  @board.none? { |value| value == ' ' }
end

def winner?(mark)
  WIN_COMBINATIONS.select do |combination|
    if @board[combination[0]] == mark &&
       @board[combination[1]] == mark &&
       @board[combination[2]] == mark
      return true
    end
  end

  false
end

def ask_position
  position = nil

  loop do
    puts 'Mark a square: (enter position 1 to 9 left to rigth)'
    position = gets.chomp.to_i
    break if a_valid_position?(position)
  end

  position - 1
end

def match_winner
  @score.key(5)
end

def calculate_score(winner)
  @score[winner] += 1
end

def print_winner(winner)
  calculate_score(winner)
  reset_board
  puts "#{winner} have won!"
end

reset_board
display_board(@board)
find_at_risk_square

loop do
  reset_score
  loop do
    user_mark(ask_position)
    puts 'You have choose'
    display_board(@board)

    if winner?('O')
      print_winner('player')
    elsif winner?('X')
      print_winner('computer')
    elsif board_full?
      reset_board
      puts 'It\'s a tie!'
    else
      puts 'Computer choose'
      machine_mark(obtain_machine_position)
      display_board(@board)
      print_winner('computer') if winner?('X')
    end

    if match_winner
      puts "Score: #{@score}... The winner is: #{match_winner}"
      break
    end
  end

  puts 'Do you want to play again?'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
