class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)

        unless @parent.nil?
            self.parent.children.delete(self)
        end

        @parent = parent_node 

        if !@parent.nil?
            parent_node.children.each do |child|
                @children << child unless @children.include?(child)
            end
            parent_node.children << self
        end

    end

    def add_child(new_child)
        new_child.parent=(self)
    end

    def remove_child(bye_child)
        bye_child.parent = nil
        raise if !self.children.include?(bye_child)
    end

    def bfs(target)
        queue = []
        queue << self
        until queue.empty?
            current_node = queue.shift
            return current_node if current_node.value == target
            current_node.children.each { |child| queue << child }
        end
        nil
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            child.dfs(target)
        end
        nil
    end

end