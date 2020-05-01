class Card 
    attr_reader :value, :symbol, :drawn
    def initialize(value, symbol)
        @value = value
        @symbol = symbol
        @drawn = false 
    end 

    def to_s 
        case symbol 
        when :heart 
            "♥︎"
        when :diamond 
           "♦︎"
        when :clover 
            "♣︎"
        when :spade 
            "♠︎"
        end 
    end

    def draw 
        @drawn = true 
    end 

    def inspect
        "#{@value} #{self.to_s}"
    end
end 

 