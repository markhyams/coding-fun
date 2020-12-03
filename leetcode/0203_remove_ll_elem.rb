# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}

# DH -> 1->2->2->3->4->5->6
#       c    
#          n
# 
# if next != val, move both pointers
#   current = current.next
#   next = current.next
# 
# if next == val, 
#   # move next pointer
#   next = next.next # when last, next gets set to nil
#   set current.next = next # when last current.next gets set to nil
# 
# 
# 
# Output: 1->2->3->4->5

def remove_elements(head, val)
  return nil if head.nil? # special case
    
  dummy = ListNode.new
  dummy.next = head
  current = dummy
  nextt = current.next

  while current.next
    if nextt.val != val
      current = current.next
      nextt = nextt.next
    else
      nextt = nextt.next
      current.next = nextt
    end
  end

  dummy.next
end