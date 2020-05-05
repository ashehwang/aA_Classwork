require "byebug"

class Integer
  # Integer#hash already implemented for you
end

# class Array
#   def hash

#   end
# end

class String
  def hash
    alphabet =("A".."z").to_a
    hash_num = Hash.new(0)
    alphabet.each_with_index do |alph, i|
      hash_num[alph] = i
    end
    hash_score = 0
    self.each_char.with_index do |char, i|
      hash_score += hash_num[char] * i
    end
    hash_score.hash
  end
end

# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     0
#   end
# end
