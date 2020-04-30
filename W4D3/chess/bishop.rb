require_relative "slidable"
require_relative "piece"

class Bishop < Piece
    include Slidable

    def move_dirs
        diagonal_dirs
    end
    
    def symbol
        color == :white ? "WB" : "BB"
    end
end