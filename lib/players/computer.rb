module Players
    class Computer < Player

        def move(board)
            
            available_moves = []
            board.cells.each.with_index(1) do |cell, index|
                if cell == " "
                    available_moves << index.to_s
                end
            end
            available_moves
        end

    end
end