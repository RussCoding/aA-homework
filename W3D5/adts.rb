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
      @stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack[-1]
    end
  end

  class Queue
    def initialize
      @queue = Array.new
    end
    
    def enqueue(el)
      @queue.unshift(el)
    end
    
    def dequeue
      @queue.shift
    end
    def peek
      @queue[0]
    end
  end