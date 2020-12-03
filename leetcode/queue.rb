1 -> 2 -> 3 

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end
end

class Queue
  def initialize
    @front = nil
    @back = nil
  end

  def enqueue(data)
    if @front
      @front.next = Node.new(data)
      @front = @front.next
    else
      el = Node.new(data)
      @front = el
      @back = el
    end
  end

  def dequeue
    return nil unless @back
    el = @back
    @back = @back.next
    el.data 
  end
end