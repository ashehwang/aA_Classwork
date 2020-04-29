require_relative "slidable"

class Rook
    include Slidable

    def move_dirs
        horizontal_dirs
    end
    
    #go up and down
end