require 'pry'
class Board

    attr_accessor :cells

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def initialize
        reset!
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        index = input.to_i - 1
        @cells[index]
    end

    def full?
        @cells.none? { |cell| cell == " "}         
    end

    def turn_count
        @cells.count { |cell| cell == "X" || cell == "O"}
    end

    def taken?(input)
        index = input.to_i - 1
        @cells[index] == "X" || @cells[index] == "O"  ? true : false
    end

    def valid_move?(input)
        index = input.to_i - 1
        !taken?(input) && index >= 0 && index < 9 
    end

    def update(input, player)
        index = input.to_i - 1
        @cells[index] = player.token
    end

end