# top -> 1 -> 2 -> 3 -> 4


class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end
end

class Stack
  attr_reader :length

  def initialize
    @top = Node.new('top-dummy')
    @length = 0
  end

  def push(data)
    #create node
    new_node = Node.new(data)

    # if stack is not empty
    if @top.next
      nextt = @top.next
      new_node.next = nextt
    end

    @top.next = new_node
    @length += 1
    data
  end

  def pop
    value = @top.next.data
    @top.next = @top.next.next

    @length -= 1
    # return the value
    value
  end

  def read
    @top.next.data
  end
end

stack = Stack.new
stack.push('hello')
stack.push('world')

p stack

p stack.pop # world
p stack.read # hello