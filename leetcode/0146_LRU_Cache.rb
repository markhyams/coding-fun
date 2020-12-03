=begin
key -> value data structure
keep track of how many items are in the cache

keep track of WHEN the item has been requested

use a queue to move the most recenlty used item to the front of the queue

when an item is added, add to the end of the queue
queue contains keys

capacity 2

queue = [1,3]


=end

class LRUCache

  =begin
      :type capacity: Integer
  =end
      def initialize(capacity)
        @capacity = capacity
        @store = {}
        @count = 0
        @queue = []
      end
  
  
  =begin
      :type key: Integer
      :rtype: Integer
  =end
      def get(key)
        value = @store[key]
        # move the item to the front of the queue
        move_to_top_of_queue(key) if value
        
        value || -1
      end
  
  
  =begin
      :type key: Integer
      :type value: Integer
      :rtype: Void
  =end
      def put(key, value)
        if @store[key]
          @store[key] = value
          move_to_top_of_queue(key)
          return
        end
        
        if @count < @capacity
          @count +=1
          @store[key] = value
          @queue.unshift(key)
          return
        end
        
        evict
        @queue.unshift(key)
        @store[key] = value
          
      end
  
      private
    
      def move_to_top_of_queue(key_input)
        # find key in queue
        index = @queue.index(key_input)
        # slice it out
        @queue.slice!(index)
        # push to front of queue
        @queue.unshift(key_input)
      end
      
      def evict
        # remove item from back of queue
        key_to_remove = @queue.pop
        # remove item from store
        @store.delete(key_to_remove)
      end
  
  end
  
  
  
  # Your LRUCache object will be instantiated and called as such:
  # obj = LRUCache.new(capacity)
  # param_1 = obj.get(key)
  # obj.put(key, value)