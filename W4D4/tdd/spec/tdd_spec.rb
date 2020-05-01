require "tdd"


describe  'Array'  do 

    describe "#my_uniq" do 
        it "return unique element in the order they appear" do 
            expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
        end 
    end 

    describe "#two_sum" do 
        it "finds positions of all the pairs that sums to zero" do 
            expect([-1,0,2,-2,1].two_sum).to eq([[0,4],[2,3]])
        end 
    end 
end 

describe "#my_transpose" do
    it "returns the transpose of the 2D array" do
        expect(my_transpose([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ])).to eq([[0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]])
    end
end

describe "#stock_picker" do
    let(:stock_price) { {d1: 40, d2: 30, d3: 90, d4: 50, d5: 100, d6: 10} }
    it "takes the most profitable pair of days to first buy stock and then sell the stock" do
        expect(stock_picker(stock_price)).to eq([:d2, :d5])
    end
end

describe "HanoiGame" do 
    subject(:hanoi) {HanoiGame.new}
    describe "#initialize" do 
        it "will create three arrays " do 
            expect(hanoi.pile1).to eq([])
            expect(hanoi.pile2).to eq([])
            expect(hanoi.pile3).to eq([3,2,1])
        end 
    end 

    describe "#won?" do 
        it "will return true if one of the piles is in descending order and other two are empty" do 
          hanoi.pile1 = [3,2,1]
          hanoi.pile3 = []
          expect(hanoi.won?).to be(true)
        end 
    end

    describe "#move" do
        it "will give an error if user tries to put larger disk on top of smaller disk" do
            hanoi2 = HanoiGame.new
            hano2.move([3,1])
            hano2.move([3,2])
            expect{ hano2.move([3,1]) }.to raise_error("can't put larger disk on smaller!")
        end
    end
end