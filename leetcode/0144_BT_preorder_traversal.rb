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
# @return {Integer[]}

# depth first traversal

#        1
#       / \
#      2   3
#     / \  / \ 
#    4   5 6  7  




#    1, 2, 4, 5, 3, 6, 7

# process the current node (push to the result)
# push right to the stack
# if left exists "go that way", current = current.left

# repeat above until left is nil?

# we are done when left is nil stack is empty




def preorder_traversal(root)
  return [] if root.nil?
  stack = []
  result = []
  current = root
  
  while current.left || current.right || !stack.empty?
    result.push(current.val)
  
    stack.push(current.right) if current.right
    
    if current.left
      current = current.left
    else
      current = stack.pop
    end
  end
  
  result.push(current.val)
    
  result  
end

