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

# turn the tree into a matrix with a breadth-first traversal

-10 x  x   x
 9  x  20  x 
 x  x  15  17

rules for traversing matrix:
  can only go from one level to the, no side-to-side movement
  up, only one choice, the number above, or if above is empty, traverse left to number
  
come up with all paths, a bunch of arrays
call max subarray sum on each array
  


def max_path_sum(root)
    
end