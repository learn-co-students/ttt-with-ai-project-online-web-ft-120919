class Game



    attr_accessor :board, :player_1, :player_2
    # attr_reader :player_1, 
    # player_2

    WIN_COMBINATIONS = [
        [0, 1, 2], 
        [3, 4, 5], 
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        # binding.pry
        # assume always goes first?
        board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def won?
        result = false
        i = 0 
        while i < WIN_COMBINATIONS.length do 
        if board.cells[WIN_COMBINATIONS[i][0]] == board.cells[WIN_COMBINATIONS[i][1]] && board.cells[WIN_COMBINATIONS[i][1]] == board.cells[WIN_COMBINATIONS[i][2]] && board.cells[WIN_COMBINATIONS[i][0]] != " " 
            result = WIN_COMBINATIONS[i]
        end
        i += 1
        end
        result 
    end

    def draw?
        board.full? && !won?
    end

    def over?
        draw? || won? 
    end

    def winner 
        if won?
            result = false
            i = 0 
            while i < WIN_COMBINATIONS.length do 
            if @board.cells[WIN_COMBINATIONS[i][0]] == @board.cells[WIN_COMBINATIONS[i][1]] && @board.cells[WIN_COMBINATIONS[i][1]] == @board.cells[WIN_COMBINATIONS[i][2]] && @board.cells[WIN_COMBINATIONS[i][0]] != " " 
                result = @board.cells[WIN_COMBINATIONS[i][0]]
                # binding.pry
            end
            i += 1
            end
        end
        result
    end

    def turn 
        puts "Please enter a number (1-9):"
        # input = gets.strip
        # input = input.to_i
        # binding.pry
        # binding.pry
        input = current_player.move(@board)
            
        if input
            board.update(input, current_player)
        else
            turn
        end
        
    end

    def play 
        until over?
            turn   
        end 
          
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end 

    end

    

end