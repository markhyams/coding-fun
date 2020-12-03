def remove_nth_from_end(head, n)
  return nil if head.next.nil? || head.nil?
  # move front pointer n nodes into the list
  front = head
  node_count = 1
  
  while node_count <= n
    front = front.next
    node_count += 1
  end
  
  return head.next unless front
  
  # move both pointers until the front node is nil
  back = head
  while front.next
    front = front.next
    back = back.next
  end
  
  node_after_node_to_delete = back.next.next
  back.next = node_after_node_to_delete
  head
end