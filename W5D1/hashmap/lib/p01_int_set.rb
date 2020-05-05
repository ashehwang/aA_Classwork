class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise ArgumentError.new("Out of bounds") unless is_valid?(num)
    return false if @store[num]
    @store[num] = true
    true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num) 
    @store[num] == true
  end

  private

  def is_valid?(num)
    num < @store.length && num >= 0
  end

  def validate!(num)
  end
end


class IntSet

  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % @store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      resize! if num_buckets == count
      self[num] << num 
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % self.store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    current_ele = @store.flatten
    @store = Array.new(2 * num_buckets){Array.new}
    @count = 0
    current_ele.each do |ele|
      insert(ele)
    end
  end
end
