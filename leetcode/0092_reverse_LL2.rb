# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
#
# use previous reverse method somehow?
# 
# when we arrive at m-1, save that element, then start reversing,
#     m       
#     2 > 3 > 4 > 5
#     2 < 3 < 4   5  
#             returned  
#     retain reference to first node  
#        

# keep a counter to track which element we are on
# when we reach n, set m-1 to point to current
# set m to point to n+1
#
# length of reversed portion is m - n - 1
# pass in length desired to reverse list

#
#
def reverse_between(head, m, n)
  return nil if head.nil?
  
  rev_len = n - m + 1
  
  # if m = 1 call with curr as the head
  if m == 1
    return reverse_sublist(head, rev_len) 
  end
  
  curr = head
    
  # move through list until reaching m - 1
  # if m > 1, move forward to m - 1
  # 
  if m > 1
    counter = 1
    while counter < m - 1
      curr = curr.next
      counter += 1
    end
  end
       
  curr.next = reverse_sublist(curr.next, rev_len)
  head
end

def reverse_sublist(head, rev_len)
  return nil if head.nil?
  count = 1
  prev = nil
  curr = head
  nextt = curr.next
  
  while curr
    curr.next = prev
    
    # break if we have reached counter length
    if count == rev_len
      head.next = nextt
      return curr
    end  
    
    # move pointers
    prev = curr
    curr = nextt
    nextt = curr.next if curr
    
    # increment counter
    count += 1
  end
  
  prev
end