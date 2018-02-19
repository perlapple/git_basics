
require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new()}
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked?}
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !winning_marker.nil?
  end

  def line_matches_a_marker(line)
    [@squares[line[0]].marker, @squares[line[1]].marker, @squares[line[2]].marker].uniq.one?
  end

  def winning_marker
    WINNING_LINES.each do |line|
      return @squares[line[0]].marker if line_matches_a_marker(line) && @squares[line[0]].marked?
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def draw
    puts '     |     |'
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts '     |     |'
    puts  '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts '     |     |'

  end

  def []=(key, marker)
    @squares[key].marker = marker
  end
end

class Square
  INITIAL_MARKER = ' '.freeze
  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze
  FIRST_TO_MOVE = HUMAN_MARKER
  RESULTS_TEXT = {
    human: 'You won!',
    computer: 'Computer won!',
    tie: 'It\'s a tie!'
  }.freeze

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    display_welcome_message

    loop do
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end

      display_result
      break unless play_again?
      reset
    end

    display_goodbye_message
  end

  private
  
  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
  end

  def clear
    system "clear"
  end

  def display_board()
    puts "You're an #{human.marker}. Computer is a #{computer.marker}"
    board.draw
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def human_moves
    puts "Choose a squere (#{board.unmarked_keys.join(', ')})"
    square = nil

    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice"
    end

    board[square] = @human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_result
    clear_screen_and_display_board
    puts RESULTS_TEXT[result]
  end

  def result
    case board.winning_marker
    when human.marker
      :human
    when computer.marker
      :computer
    else
      :tie
    end
  end

  def play_again?
    answer = nil

    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w[y n].include?(answer)
      puts 'Sorry, must be y or n'
    end

    answer == 'y'
  end

  def reset
    board.reset
    clear
    @current_marker = FIRST_TO_MOVE
    puts 'Let\'s play again'
    puts ''
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def change_marker(marker)
    @current_marker = marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      change_marker(COMPUTER_MARKER)
    else
      computer_moves
      change_marker(HUMAN_MARKER)
    end
  end
end

game = TTTGame.new
game.play
