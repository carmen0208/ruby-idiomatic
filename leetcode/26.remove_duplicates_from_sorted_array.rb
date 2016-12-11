# https://leetcode.com/problems/remove-duplicates-from-sorted-array/
#
# Given a sorted array, remove the duplicates in place such that each element
# appear only once and return the new length. Do not allocate extra space for
# another array, you must do this in place with constant memory.
#
# For example:
#
#     Given input array nums = [1, 1, 2], your function should return
#     length = 2, with the first two elements of nums being 1 and 2
#     respectively. It doesn't matter what you leave beyond the new length.


# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  cursor = 0
  size = 0
  while cursor < nums.size
    num = nums[cursor]
    cursor += 1
    while nums[cursor] == num
      # nums.pop(cursor)
      cursor += 1
    end
    #this is a way to not allocate extra space, like new a new num. just fresh the old one, it is fine!
    nums[size] = num
    size += 1
  end
  p size
  nums
end

p remove_duplicates([1,1,2,2,5,4,9,6,7,6,0])

## Ingore it I don't think it's a good question as it is confused me a lot!!!
