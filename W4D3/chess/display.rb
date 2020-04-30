require_relative 'cursor'
require 'colorize'

class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        @board.each do |row|
            puts row.map(&:symbol).join("  ")
            puts "                               "
        end
        nil
    end

end