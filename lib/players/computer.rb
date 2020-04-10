module Players
  class Computer < Player

    def move(board)
      pos = board.choices.last
      puts pos
      pos
    end
    
  end
end
