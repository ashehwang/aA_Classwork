module Slidable

    DIAGONAL_DIRS = [[1,1],[-1,-1],[1,-1],[-1,1]]
    HORIZONTAL_DIRS = [[0,1],[1,0],[-1,0],[0,-1]]

    def moves
        available_moves = []
        move_dirs.each do |dx, dy|
            available_moves += grow_unblocked_moves_in_dir(dx,dy) 
        end
        available_moves
    end

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end
    
    # private

    def move_dirs
        #will be rewritten in class_piece
    end

    def grow_unblocked_moves_in_dir(dx,dy) 
        moves = [] 
        x , y = pos 
        
        while (x + dx).between?(0,7) && (y + dy).between?(0,7)
            x , y = x + dx , y + dy
            pos = [ x , y ]

            if board[pos].empty?
                moves << pos
            else
                moves << pos if board[pos].color != self.color
                break
            end
        end

        moves
    end

end