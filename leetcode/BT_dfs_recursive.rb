def dfs(root)
  result = []
  dfs_helper(root, result)
end
def dfs_helper(root, res)
  return res if root.nil?
  res << root.val
  left = dfs_helper(root.left, res)
  right = dfs_helper(root.right, res)
  res
end
