class Board
  
  attr_accessor :cells, :choices
  
  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
    @choices = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def display
    c = self.cells
    puts ""
    puts " #{c[0]} | #{c[1]} | #{c[2]} "
    puts "-----------"
    puts " #{c[3]} | #{c[4]} | #{c[5]} "
    puts "-----------"
    puts " #{c[6]} | #{c[7]} | #{c[8]} "
    puts ""
  end

  def update(index, token)
    self.cells[index.to_i - 1] = token
  end

  def valid_move?(user_input)
    (user_input.to_i).between?(1, 9) && !taken?(user_input)
  end

  def taken?(user_input)
    ![" ", "", nil].include?(position(user_input))
  end

  # returns string value of board cell
  def position(user_input)
    index = user_input.to_i - 1
    self.cells[index]
  end

  def turn_count
    count = 0
    self.cells.each do |position|
      if ["X", "O"].include?(position)
        count += 1
      end
    end
    count
  end

  def full?
    self.cells.all? {|pos| ["X", "O"].include?(pos)}
  end

end