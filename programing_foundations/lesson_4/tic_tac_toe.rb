
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

def obtain_machine_position
  posibilities = []
  @board.each_with_index do |value, position|
    posibilities << position if value == ' '
  end

  posibilities.sample
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

reset_board

loop do
  reset_score
  loop do
    user_mark(ask_position)
    puts "You have choose"
    display_board(@board)

    if winner?('O')
      calculate_score('player')
      reset_board
      puts 'Congrats, you have won'
    elsif winner?('X')
      calculate_score('computer')
      reset_board
      puts 'Uh no, computer won'
    elsif board_full?
      reset_board
      puts 'It\'s a tie!'
    else
      puts "Computer choose"
      machine_mark(obtain_machine_position)
      display_board(@board)
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
