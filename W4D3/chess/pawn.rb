require_relative "piece"

class Pawn < Piece

    def symbol
        color == :black ? "♟ " : "♙ " #white row 6 black 1 ♙ ♟
    end
    
    def moves
        side_attacks + forward_steps
    end
    
    def forward_dir
        color == :black ? 1 : -1
    end

    def at_start_row?
        x , y = pos
        return true if color == :white && x == 6
        return true if color == :black && x == 1
        false
    end

    def forward_steps #1,0 can move to 2,0 or 3,0
        forward_moves = []
        x , y = pos
        pos = [x + forward_dir, y]
        other_pos = [x + 2 * forward_dir, y]

        if at_start_row?
            forward_moves << pos
            forward_moves << other_pos
        else
            forward_moves << pos if board[pos].empty?
        end
        forward_moves
    end

    def side_attacks
        side_attacks = []
        x, y = pos
        pos = [x + forward_dir, y + forward_dir]
        other_pos = [x + forward_dir, y - forward_dir]

        if board[pos].color != self.color && !board[pos].empty?
            side_attacks << pos
        end

        if board[other_pos].color != self.color && !board[other_pos].empty?
            side_attacks << other_pos
        end
        side_attacks
    end

end