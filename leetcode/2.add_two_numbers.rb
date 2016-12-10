
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

## This is key of how to resolve the problem, a = b means that their a.next = b.next. the could do a infinit loop then
def linked(value)
  a ,b = nil, nil
  value.each do |i|
    node = ListNode.new(i)
    if a
      a.next  = node
      a= node
    else
      a = node
      b = a
    end
    # a ? (; ) : (a = LinkNode.new(i); b = a)
  end
  b
end

p linked([4,5,6,7,8,9])

# tmp
# def add_two_numbers(l1, l2)
#   n1 , n2,tmp, final = l1, l2,nil,nil
#
#   while n1 || n2
#     n1 ? (v1 = n1.val; n1 = n1.next) : (v1 = 0)
#     n2 ? (v2 = n2.val; n2 = n2.next) : (v2 = 0)
#
#     n = ListNode.new(v1 + v2)
#
#     tmp ? (tmp.next = n; tmp = n ) : (tmp = n; final = tmp)
#   end
#   final
# end


# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
# def add_two_numbers(l1, l2)
#   n1, n2, n3, l3, carry = l1, l2, nil, nil, 0
#
#   while n1 || n2
#     n1 ? (v1 = n1.val; n1 = n1.next) : (v1 = 0)
#     n2 ? (v2 = n2.val; n2 = n2.next) : (v2 = 0)
#
#     sum = v1 + v2 + carry
#     carry, digit = sum.divmod(10)
#
#     n = ListNode.new(digit)
#     n3 ? (n3.next = n; n3 = n) : (n3 = n; l3 = n3)
#   end
#   n3.next = ListNode.new(carry) if carry.nonzero?
#
#   p l3
# end



#
#
# l1 = ListNode.new(2)
# l12 = ListNode.new(4)
# l13 = ListNode.new(3)
# l12.next = l13
# l1.next = l12
# p l1
#
# l2 = ListNode.new(5)
# l22 = ListNode.new(6)
# l23 = ListNode.new(4)
# l22.next = l23
# l2.next = l22
# p l2
#
# p add_two_numbers(l1 ,l2)