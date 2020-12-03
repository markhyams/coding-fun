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


# pass down max and min

def is_valid_bst(root)
  is_valid_bst_helper(root, -Float::INFINITY, Float::INFINITY)
end

def is_valid_bst_helper(root, min, max)
  # it is a valid binary tree if it is composed of two valid binary trees, with updated min and max
  return true if root == nil
  # base case
  if root.val >= max || root.val <= min
    return false
  end
  
  left_result = is_valid_bst_helper(root.left, min, root.val)
  right_result = is_valid_bst_helper(root.right, root.val, max)
  
  left_result && right_result
end