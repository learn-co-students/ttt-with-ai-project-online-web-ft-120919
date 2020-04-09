WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def current_player
  turn_count.even? ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.find do |combo|
    combo.all? {|i| @board[i] == "X"} || combo.all? {|i| @board[i] == "O"}
  end
end

def draw?
  full? && !won?
end

def over?
  won? || draw? || full?
end

def winner
  @board[won?[0]] if won?
end

def play
  turn until over?
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end