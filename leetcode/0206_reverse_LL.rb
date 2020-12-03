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

#  <-1  2->3->4->5
#    p  
#       c  
#          n 
#
# prev = nil
# curr = head
# nextt = head.next
# 

# set curr.next to prev

# move pointers ahead
# set prev = curr
# set curr = nextt
# set nextt = curr.next # next will be nil when we land on final node, make curr sure not nil on last iteration
def reverse_list(head)
  return nil if head.nil?
  
  prev = nil
  curr = head
  nextt = curr.next
  
  while curr
      curr.next = prev
      
      # move pointers
      prev = curr
      curr = nextt
      nextt = curr.next if curr
  end
  
  prev
end