require "set"
class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end

    
end
def bfs(starting_node, target_value)
    return starting_node if starting_node.val == target_value
    visited = Set[starting_node.val]
    queue = starting_node.neighbors.map {|node| node}
    while !queue.empty?
        current = queue.shift
        return current if current.val == target_value
        visited.add(current.val)
        current.neighbors.each {|node| queue << node if !visited.include?(node.val)}
    end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
p bfs(a, "b")
p bfs(a, "f")

