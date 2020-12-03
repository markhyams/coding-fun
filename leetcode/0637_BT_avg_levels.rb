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
# @return {Float[]}


# 3 goes in result

# 3, 9, 20, nil, nil, 15, 7
# [ [3],
#   [9, 20],
#   [15, 7]
# ]  

# enqueue -> push
# dequeue -> shift


def average_of_levels(root)
  bfs(root)
end

def bfs(root)
  queue = []
  result = []
  current = [0, root]
  
  
  while current
    level = current[0]
    node = current[1]
    
    result.push([level, node.val])
    
    queue.push([level + 1, node.left]) if node.left
    queue.push([level + 1, node.right]) if node.right
    
    current = queue.shift
  end
  

  map_to_avg(result)
end

def map_to_avg(arr)
  result = {}
  
  arr.each do |pair|
    level = pair[0]
    val = pair[1]

    if result[level]
      result[level].push(val)
    else
      result[level] = [val]
    end
  end

  final_result = []
  result.each do |level, vals|
    final[level] = vals.sum / vals.length.to_f
  end

  final_result
end


