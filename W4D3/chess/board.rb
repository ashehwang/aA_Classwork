require_relative "piece.rb"
require_relative "queen.rb"
require_relative "bishop.rb"
require_relative "rook.rb"
require_relative "nullpiece.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "pawn.rb"
require "byebug"

class Board

    def initialize
        @board = Array.new(8){Array.new(8)}
        populate
    end

    def populate
        (2..5).each do |i|
            (0..7).each do |j|
                @board[i][j] = Nullpiece.instance
            end
        end
        (0..7).each do |k|
            @board[1][k] = Pawn.new(:black, self, [1,k])
            @board[6][k] = Pawn.new(:white, self, [6,k])
        end
        (0..7).each do |l|
            @board[0][l] = Rook.new(:black, self, [0,l])
            @board[7][l] = Rook.new(:white, self, [7,l])
        end
        @board[0][3] = King.new(:black, self, [0,3])
        @board[7][3] = King.new(:white, self, [7,3])
        @board[0][1] = Knight.new(:black, self, [0,1])
        @board[7][1] = Knight.new(:white, self, [7,1])
        @board[0][6] = Knight.new(:black, self, [0,6])
        @board[7][6] = Knight.new(:white, self, [7,6])

        @board[0][4] = Queen.new(:black, self, [0,4])
        @board[7][4] = Queen.new(:white, self, [7,4])
        @board[0][2] = Bishop.new(:black, self, [0,2])
        @board[7][2] = Bishop.new(:white, self, [7,2])
        @board[0][5] = Bishop.new(:black, self, [0,5])
        @board[7][5] = Bishop.new(:white, self, [7,5])
        nil
    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]
        begin 
            raise if self[start_pos].empty?
            raise if !valid?(end_pos)
            raise if !piece.moves.include?(end_pos)
            self[end_pos] = piece
            self[start_pos] = Nullpiece.instance
            piece.pos = end_pos
        rescue StandardError => err 
            if self[start_pos].empty?
                puts "please move a valid piece"
            elsif !piece.moves.include?(end_pos)
                puts "that piece can't move to that position"
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

    def find_king(color)
        my_king = @board.flatten.select{|ele| ele.is_a?(King) && ele.color == color}
        my_king[0].pos
    end

    def in_check?(color)
        enemies = @board.flatten.select{|ele| ele.color != color}
        enemy_moves = []
        enemies.each do |enemy|
            enemy_moves += enemy.moves
        end

        # enemy_moves.include?(find_king(color))
    end

    def render
        @board.each do |row|
            puts row.map(&:symbol).join("  ")
            puts "                               "
        end
        nil
    end

    def empty?(pos)
        self[pos].empty?
    end

    def inspect
        "this is my board"
    end

end