class Game

  attr_accessor :board, :player_1, :player_2, :quit

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"), board= Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      combo.all? {|i| @board.cells[i] == "X"} || combo.all? {|i| @board.cells[i] == "O"}
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw? || @quit
  end

  def winner
    @board.cells[self.won?[0]] if self.won?
  end

  def turn
    puts "Player #{current_player.token}, please enter 1-9 (or enter 'exit' to leave game) \n\n"
    input = current_player.move(@board)
    if input == "exit"
      @quit = true
    elsif @board.valid_move?(input)
      @board.update(input, current_player.token)
      @board.choices.delete(input)
      @board.display
    else
      invalid
      turn
    end
  end
  
  def start
    puts "\nTIC-TAC-TOE\n\n"
    choice
    play
    game_over?
  end

  def play
    @board.display
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def game_over?
    unless @quit
      puts "\nPlay again?\n\n"
      input = gets.strip.downcase[0]
      unless input == "n"
        if input == "y"
          @board.reset!
          start
        else
          invalid
          game_over?
        end
      end
    end
  end
  
  def choice
    choice_text
    input = gets.strip
    unless input == "1"
      if input == "2"
        which_player
      elsif input == "3"
        @player_1 = Players::Computer.new("X")
        @player_2 = Players::Computer.new("O")
      else
        invalid
        choice
      end
    end
    puts "\nFirst player uses 'X'\n\n"
  end

  def choice_text
    puts "Enter a number to choose gameplay\n\n"
    puts "1  Human vs. Human"
    puts "2  Human vs. Computer"
    puts "3  Computer vs. Itself\n\n"
  end

  def invalid
    puts "\nInvalid input. Please try again.\n\n"
    @board.display
  end

  def which_player
    puts "\nChoose who goes first\n\n"
    puts "1  You"
    puts "2  Computer\n\n"
    input = gets.strip
    if input == "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
    elsif input == "2"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Human.new("O")
    else
      invalid
      which_player
    end
  end

end