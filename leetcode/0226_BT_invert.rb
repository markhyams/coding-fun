def invert_tree(root)
  # base case root is nil
  return if root == nil
    
  # swap the two children 
  root.left, root.right = root.right, root.left
  
  invert_tree(root.left)
  invert_tree(root.right)

  root
end