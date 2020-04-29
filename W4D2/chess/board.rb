require_relative "piece.rb"

class Board

    def initialize
        @board = Array.new(8){Array.new(8)}
    end

    def populate
        (2..5).each do |i|
            (0..7).each do |j|
                @board[i][j] = Piece.new("nul")
            end
        end
        (0..7).each do |k|
            @board[1][k] = Piece.new("paw")
            @board[6][k] = Piece.new("paw")
        end
        @board
    end

    def move_piece(start_pos, end_pos)
        begin 
            raise if self[start_pos].nil?
            raise if !valid?(end_pos)
            self[end_pos] = self[start_pos]
            self[start_pos] = nil
        rescue StandardError => err 
            if self[start_pos].nil?
                puts "please move a valid piece"
            elsif !valid?(end_pos)
                puts "please move to a valid position within the board"
            end
        end
    end

    def valid?(pos)
        x, y = pos
        x.between?(0,7) && y.between?(0,7)
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end

end