# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}

# DH->1->1

#  p  
#        c 
#      
#
#
# 3 pointers, prev, current
# add a dummy head, since head can change
# while next
# prev = dh
# current = head
# 
# is current.val == current.next.val?
#   store val
#   move current until val != stored val
#   prev points to current


def delete_duplicates(head)
  return nil if head.nil?
  
  dummy = ListNode.new('dummy')
  dummy.next = head
  
  prev = dummy
  current = head
  
  while current && current.next
    if current.val != current.next.val
      prev = prev.next
      current = current.next
    else
      dup = current.val
      while current && current.val == dup
        current = current.next
      end    
      prev.next = current
    end
  end
    
  dummy.next
end