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
# @return {Integer}

# max depth is the greater of the max depth of left right, plus 1
def max_depth(root)
  return 0 if root.nil?
  
  max_left = max_depth(root.left)
  max_right = max_depth(root.right)
  
  [max_left, max_right].max + 1
end