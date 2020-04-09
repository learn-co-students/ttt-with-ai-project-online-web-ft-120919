class Board
  
  def initialize
    self.reset!
  end

  def reset!
    @board = Array.new(9, " ")
  end

  def display
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position(user_input)
    index = user_input.to_i - 1
    @board[index]
  end

  def update(index, token)
    @board[index] = token
  end

  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end

  def taken?(position)
    ![" ", "", nil].include?(@board[position])
  end

  def turn_count
    count = 0
    @board.each do |position|
      if ["X", "O"].include?(position)
        count += 1
      end
    end
    count
  end

  def full?
    @board.all? {|pos| ["X", "O"].include?(pos)}
  end

end