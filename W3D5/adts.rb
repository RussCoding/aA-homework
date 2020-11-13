class Stack
    def initialize
      # create ivar to store stack here!
      @stack = Array.new()
    end

    def push(el)
      # adds an element to the stack
      @stack.push(el)
    end

    def pop
      # removes one element from the stack
      @stack.pop(el)
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack[-1]
    end
  end