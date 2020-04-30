class Piece

    attr_reader :board, :color
    attr_accessor :pos

    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    # def inspect
    #     "#{@name}"
    # end

    def moves
        #will give back array of places piece can move to
        #mostly defined for our slidable pieces
    end

    # def to_s
    # end

    def empty?
        false #will be true for nullpiece
    end

    def valid_moves #why????? ? _ ? we already have moves
    end

    # def symbol
    # end

    private

    def move_into_check?(end_pos)
    end
end