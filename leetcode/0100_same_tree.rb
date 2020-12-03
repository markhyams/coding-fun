# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}


def is_same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if p.nil? || q.nil?
  return false if p.val != q.val
  
  p_left = p.left
  p_right = p.right
  q_right = q.right
  q_left = q.left
  
  left = is_same_tree(p_left, q_left)
  right = is_same_tree(p_right, q_right)
  
  left && right
end