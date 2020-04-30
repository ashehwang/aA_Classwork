require_relative "slidable"
require_relative "piece"

class Rook < Piece
    include Slidable

    def move_dirs
        horizontal_dirs
    end

    def symbol
        color == :white ? "WR" : "BR"
    end

end