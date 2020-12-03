=begin
1 -> 2 -> 3 -> 4 -> 5 -> 5
                                c 
                                        n
				
if next != current move both pointers

if next == current 
	move next
	current points to new next
=end

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
def delete_duplicates(head)
  return nil if head.nil?
    
    current = head
    nextt = current.next
    
    while current.next
       if nextt.val != current.val
           current = current.next
           nextt = nextt.next
       else
           nextt = nextt.next
           current.next = nextt
       end
    end
    
    head
end