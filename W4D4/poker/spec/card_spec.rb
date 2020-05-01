require 'card'

describe "Card" do 
    subject(:joker) {Card.new("A",:heart)}
    describe "#initialize" do 
        it "should have a value and a symbol" do 
            expect(joker.value).to eq("A")
            expect(joker.symbol).to be(:heart)
        end 
    end 

    describe "#to_s" do 
        it "should picture the appropriate symbol" do 
            expect(joker.to_s).to eq("♥︎")
        end 
    end 
end 