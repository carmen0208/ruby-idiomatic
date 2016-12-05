# def two_sum(nums, target)
#   k1 = 0
#   k2 = 0
#   nums.permutation(2).to_a.each do  |x, y|
#     if x + y == target
#       hash = Hash[(0..nums.size).zip(nums)]
#       k1 = hash.key(x)
#       if x == y
#         key = hash.key(x)
#         hash.delete(key)
#       end
#         k2 = hash.key(y)
#
#
#     end
#   end
#   [k1,k2].sort
# end

def two_sum(nums, target)
 map = {}
 nums.each_with_index do |num, idx|
   i = map[target - num]
   return [i + 1, idx + 1] if i
   map[num] = idx
 end
end

# nums = [0, 4, 3, 0]
# target = 0

nums = [3,2,4]
target = 6
p two_sum(nums, target)