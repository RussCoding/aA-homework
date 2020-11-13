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

  class Map
      def initialize
        @map = Array.new
      end

      def set(key,val)
        if @map.none?{|pair| pair[0] == key}
          @map << [key,val]
        else
          @map.each {|pair| pair[1] = val if pair[0] == key}
        end
      end
      
      def get(key)
        @map.each {|pair| return pair if pair[0] == key}
      end
      
      def delete(key)
        @map.reject! {|pair| pair[0] == key}
      end
      
      def show
        p @map
      end
  end