# https://leetcode.com/problems/remove-duplicates-from-sorted-list/
#
# Given a sorted linked list, delete all duplicates such that each element
# appear only once.
#
# For example:
#
#     Given 1 -> 1 -> 2, return 1 -> 2.
#     Given 1 -> 1 -> 2 -> 3 -> 3, return 1 -> 2 -> 3.


# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  curr, cursor = head, head

#counting on cursor to iterator all the items, if duplicate, the item would count ++

  while cursor
    val = cursor.val
    cursor = cursor.next
    while cursor && cursor.val == val
      cursor = cursor.next
    end

    if cursor.nil?
      curr.val, curr.next = val, nil
      break
    end
#this is the place where Head changes, as the get a value of curr and
    # define then next to curr,
    #actually, curr.next would be a reference of head's next. that's the reason
    #why it changed
    curr.val, curr = val, curr.next
  end

  head

end


l11 = ListNode.new(1)
l12 = ListNode.new(1)
l13 = ListNode.new(2)
l14 = ListNode.new(2)
l15 = ListNode.new(3)
# l16 = ListNode.new(5)

l11.next = l12
l12.next = l13
l13.next = l14
l14.next = l15
# l15.next = l16

p delete_duplicates(l11)