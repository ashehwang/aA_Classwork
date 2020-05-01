# The logic of calculating pair, three-of-a-kind, two-pair, etc. goes here.
# Logic of which hand beats which would go here.
module Hand 

    def straight_flush?(hand) #assume hand is an array of five cards
        hand.sort_by{ |card| card.value }
        hand.all?{ |card| card.symbol == hand[0].symbol }
        hand.each_with_index do |card, i|
            next if i == hand.length - 1
            return false if hand[i].value > hand[i+1].value
        end
    end

end 