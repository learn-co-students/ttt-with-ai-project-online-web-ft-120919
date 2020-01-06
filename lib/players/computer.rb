module Players
    class Computer < Player

        def move(board)
            
            available_moves = []
            board.cells.each.with_index(1) do |cell, index|
                if cell == " "
                    available_moves << index.to_s
                end
            end
            # available_moves
            # binding.pry
            # ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            # ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        end

    end
end