class Node

  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = self.next #unless @prev.nil?
    @next.prev = self.prev #unless @next.nil? || @prev.nil?
    @next = nil
    @prev = nil
  end
end

class LinkedList

  attr_reader :head, :tail
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return @head.next unless empty?
    nil
  end

  def last
    return @tail.prev unless empty?
    nil
  end

  def empty?
    @head.next == @tail
  end

  def get(key)   
    self.each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    self.any? { |node| node.key == key}
  end

  def append(key, val)
    new_node = Node.new(key,val)
    new_node.next = @tail
    new_node.prev = @tail.prev
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    unless empty?
      self.each do |node|
        if node.key == key
          node.remove
          return node.val
        end
      end
    end
  end

  def each #{} #make interate from between headnode to tailnode
    current_node = @head.next
    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
