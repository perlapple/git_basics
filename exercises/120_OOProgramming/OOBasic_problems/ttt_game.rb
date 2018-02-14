
class Board
  INITIAL_MARKER = ' '
  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new(INITIAL_MARKER)}
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end
end

class Square
  attr_accessor :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Player
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new("X")
    @computer = Player.new("O")
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
  end

  def display_board
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(1)}  |  #{board.get_square_at(1)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(1)}  |  #{board.get_square_at(1)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(1)}  |  #{board.get_square_at(1)}"
    puts "     |     |"
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def human_moves
    puts "Chose a squere between 1 - 9: "
    square = nil

    loop do
      square = gets.chomp.to_i
      break if (1..9).include?(square)
      puts "Sorry, that's not a valid choice"
    end

    board.set_square_at(square, @human)
  end

  def play
    display_welcome_message
    loop do
      display_board
      human_moves
      break if someone_won? || board_full?

      computer_moves
      break if someone_won? || board_full?
    end
    # display_result
    # display_goodbye_message
  end
end

game = TTTGame.new
game.play
