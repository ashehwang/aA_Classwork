require_relative "card.rb"

class Deck 

    attr_accessor :cards

    def initialize
        @cards = []
        make_deck
    end

    def make_deck
        symbols = [:heart, :diamond, :clover, :spade]
        values = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
        symbols.each do |symbol|
            values.each do |value|
                @cards << Card.new(value, symbol)
            end
        end
        @cards.shuffle!
    end
    
end 