require "singleton"
require_relative "piece"

class Nullpiece < Piece
    include Singleton

    def initialize 
    end

    def empty?
        true
    end

    def moves
        []
    end

    def symbol
        "  "
    end


end