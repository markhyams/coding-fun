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
# @return {Boolean}

def traverse(root, nodes = [])
  return if root.nil?
  
  traverse(root.left, nodes)
  nodes << root
  traverse(root.right, nodes)
  
  nodes
end

def is_balanced(root)
  return true if root.nil?
  all_nodes = traverse(root)
  
  all_nodes.each do |node|
    return false unless is_balanced_helper(node)
  end
  
  true
end

def is_balanced_helper(root)
  difference = max_depth(root.left) - max_depth(root.right)
  difference.abs <= 1
end

def max_depth(root)
  return 0 if root.nil?
  
  max_left = max_depth(root.left)
  max_right = max_depth(root.right)
  
  [max_left, max_right].max + 1
end