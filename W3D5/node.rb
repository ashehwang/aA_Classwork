require_relative "queue"

class Node

    attr_reader :value
    attr_accessor :children

    def initialize(value, children = [])
        @value = value
        @children = children
    end

    def bfs(value)
        queue = MyQueue.new
        queue.enqueue(self)
        until queue.empty?
            current_node = queue.dequeue
            return current_node if current_node.value == value
            current_node.children.each { |child| queue.enqueue(child) }
        end
        nil
    end

end

a = Node.new("a")
b = Node.new("b")
c = Node.new("c")
d = Node.new("d")
e = Node.new("e")
f = Node.new("f")
g = Node.new("g")
a.children = [b,c]
b.children = [d,e]
c.children = [f,g]