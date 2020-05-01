require "byebug"

class Array 
    def my_uniq 
        arr = []
        self.each do |ele|
            arr << ele unless arr.include?(ele)
        end 
        arr
    end 

    def two_sum 
        pairs = []
            (0...length-1).each do |i|
                (i+1...length).each do |j|
                    pairs << [i,j] if self[i] + self[j] == 0 
                end 
            end 
        pairs 
    end 
end 

def my_transpose(arr)
    transposed = Array.new(arr.length){Array.new(arr.length)}

    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            transposed[i][j] = arr[j][i]
        end

    end
    transposed
end

def stock_picker(hash)
    prices = hash.values 
    best = [0,0]
    (0...hash.length-1).each do |i|
        (i+1...hash.length).each do |j|
            
            current_best_price = prices[best[1]] - prices[best[0]]
            best = [i, j] if prices[j] - prices[i] > current_best_price
            
        end 
    end 
    days = hash.keys
    [days[best[0]],days[best[1]]]
end

class HanoiGame
    
    def initialize
        @pile1 = []
        @pile2 = []
        @pile3 = [3,2,1]
        @connect = {"1" => @pile1, "2" => @pile2, "3" => @pile3}
        nil
    end
    
    def won?
        @pile1 == [3,2,1] || @pile2 == [3,2,1]
    end 
    
        
    def move(input)

        display 
        begin
            puts "please select a pile to move from and to "
            input = gets.chomp.split()
        rescue NoMethodError => e  
            puts "please give us two numbers like 1 2"
            retry
        end

        current_move = @connect[input[0]].pop
        
        if @connect[input[1]].empty?
            @connect[input[1]] << current_move
        elsif
            @connect[input[1]].last > current_move
            @connect[input[1]] << current_move
        else
            puts "you cannot move a larger disk onto a smaller disk"
            @connect[input[0]] << current_move
            move
        end
    end 
    
    def play
        until won? 
            move 
        end 
        puts "Congratulations!!"
    end

    private

    def display
        puts "this is pile 1 #{@pile1}"
        puts "this is pile 2 #{@pile2}"
        puts "this is pile 3 #{@pile3}"
    end 

    attr_accessor :pile1, :pile2, :pile3
end
