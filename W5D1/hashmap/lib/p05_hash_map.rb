require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count, :store
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
  end

  def set(key, val)
  end

  def get(key)
  end

  def delete(key)
  end

  def each
    self.store.each do |bucket|
      bucket.each do |list|
        yield [list.key , list.val]
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

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

  def bucket(key)
    self.store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end
end
