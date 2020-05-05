class HashSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      resize! if num_buckets == count
      self[key] << key 
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](key)
    self.store[key.hash % self.store.length]
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
