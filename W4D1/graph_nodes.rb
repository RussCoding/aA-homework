class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end

    def bfs(starting_node, target_value)
        return starting_node if starting_node.val == target_value
        visited = [starting_node]
        queue = starting_node.neighbors.map {|node| node}
        while !queue.empty?
            current = queue.shift
            return current if current.val == target_value
            visited << current
            current.neighbors.each {|node| queue << node if !visited.include?(node)}
        end
        nil

    end
end
