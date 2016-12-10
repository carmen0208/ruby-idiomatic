# https://leetcode.com/problems/remove-nth-node-from-end-of-list/
#
# Given a linked list, remove the nth node from the end of list and return its
# head.
#
# For example:
#
#     Given linked list: 1 -> 2 -> 3 -> 4 -> 5, and n = 2. After removing the
#     second node from the end, the linked list becomes 1 -> 2 -> 3 -> 5.
#
# Note:
#
#     Given n will always be valid. Try to do this in one pass.


class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  # node it the items that need to be removed
  prefix, base = head, head

# the fast is actually the length of iteration for the next loop.
  # the basic idea of , if you want to know how much the length it
  # without get counted first. you can sum with prefix + n = overall
  n.times { prefix = prefix.next }
  return head.next if fast.nil?

  prefix, base = prefix.next, base.next while prefix.next
  #this is the only part the change the reference of the head, other part just change the value of object it self
  base.next = base.next.next
  return head
end


l11 = ListNode.new(1)
l12 = ListNode.new(2)
l13 = ListNode.new(3)
l14 = ListNode.new(4)
l15 = ListNode.new(5)
#
l11.next = l12
l12.next = l13
l13.next = l14
l14.next = l15

p remove_nth_from_end(l11, 2)