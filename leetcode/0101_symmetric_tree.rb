# solution using recursion, very similar to 'same tree' problem

def is_symmetric(root)
  return true if root.nil?
  is_sym_helper(root.left, root.right)
end

def is_sym_helper(p, q)
  return true if p.nil? && q.nil?
  return false if p.nil? || q.nil?
  return false if p.val != q.val
  
  left = is_sym_helper(p.left, q.right)
  right = is_sym_helper(p.right, q.left)
  
  left && right
end


######################################################
# solution using invert and same as helper functions #
######################################################

def is_symmetric(root)
  return true if root.nil?
  return true if root.left.nil? && root.right.nil?
  return false if root.left.nil? || root.right.nil?
  return false unless root.left.val == root.right.val
  
  new_left = invert_tree(root.left)
  
  is_same_tree(new_left, root.right)
end

def invert_tree(root)
  # base case root is nil
  return if root == nil
    
  # swap the two children 
  root.left, root.right = root.right, root.left
  
  invert_tree(root.left)
  invert_tree(root.right)

  root
end

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

