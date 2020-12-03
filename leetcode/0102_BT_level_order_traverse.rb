# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[][]}

# start with a queue 
def level_order(root)
  return [] if root.nil?
  result = []
  queue = []
  
  queue.push(root)
  
  while !queue.empty?
    # create new array for level items
    level_items = []
      
    # get queue size
    num_items_on_level = queue.size
    
    # process number of items from queue equal to its size item from queue
    num_items_on_level.times do
      
      # get node from front of queue
      current = queue.shift
      
      # push it on to level items array
      level_items.push(current.val)
      
      # add its children to end of queue
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right      
    end
    
    # push level_items array onto result array
    result.push(level_items)
  end
  
  result 
end