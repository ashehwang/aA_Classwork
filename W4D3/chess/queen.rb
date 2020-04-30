require_relative "slidable"
require_relative "piece"

class Queen < Piece
    include Slidable

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
    
    def symbol
        color == :white ? "WQ" : "BQ"
    end

end