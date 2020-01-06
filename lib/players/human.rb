module Players
    class Human < Player

        def move(board)
            # binding.pry
            puts "Where do you want to go?"
            input = gets.strip
            board.valid_move?(input) ? input : nil
            # board.update(input, self)
        end

      
    end
  end