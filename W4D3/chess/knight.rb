require_relative "stepable"
require_relative "piece"

class Knight < Piece
    include Stepable

    def move_diffs
        [[1,2], [1,-2], [-1,2], [-1,-2], [2,1], [2, -1], [-2, 1], [-2, -1]]
    end
    
    def symbol
        color == :white ? "WK" : "BK"
    end

end