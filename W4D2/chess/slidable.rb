module Slidable

    DIAGONAL_DIRS = [[1,1],[-1,-1],[1,-1],[-1,1]]
    HORIZONTAL_DIRS = [[0,1],[1,0],[-1,0],[0,-1]]

    def moves
    end

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end
    
    private

    def move_dirs
        #will be rewritten in class_piece
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        x , y = pos
        # dx + x , dy + y until one of them 8 || we hit something on board
        #will track in that direction of move_dirs how far I can go; dx/dy are in the direction we're heading 
    end


    #bishop (moves diag) rook (moves straight) queen (both)
    #piece initialized with color, board, pos
end