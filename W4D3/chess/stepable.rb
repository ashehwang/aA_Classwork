module Stepable

    def moves

        valid_moves = []

        move_diffs.each do |dx, dy|
            x, y = pos
            pos = [dx + x , dy + y]

            if board.valid?(pos) && board.empty?(pos)
                valid_moves << pos
            elsif (board[pos].color != self.color) && board.valid?(pos)
                valid_moves << pos
            end

        end

        valid_moves
    end

    def move_diffs
        #king and knight will overwrite
    end

end