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

# this is preorder traversal with a couple extra steps

# root is current
# add current.val to result array
# check if current is leaf
#   if yes, 
#   - grab result array at this point and copy to list
#   - pop one value off result array
#   - pop a second value off result array if current came from stack (it was a right child)
# -     OR set result.length to stack.length
# 
#     
    
# right child added to stack

# current becomes left child (if exists)  OR stack.pop


def sum_numbers(root)
  stack = []
  result = []
  
  numbers = []
  
  current = root
  came_from_stack = false
  
  while current # maybe not the right stopping condition
    result.push(current.val)
    
    if is_leaf(current)
      numbers.push(to_number(result))
      
      # do this
      result = result[0, stack.length]
      
    end
    
    
    stack.push(current.right) if current.right
    
    if current.left
      current = current.left
    else
      current = stack.pop
      
    end
    
  end
  
  
  numbers
end

def is_leaf(node)
  node.left.nil? && node.right.nil?
end

def to_number(nums)
  nums.map(&:to_s).join.to_i
end 

