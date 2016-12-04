# Description:
#
#     Don't be afraid, the description is rather long but - hopefully - it is in order that the process be well understood.
#
# You are given a string s made up of substring s(1), s(2), ..., s(n) separated by whitespaces. Example: "after be arrived two My so"
#
# Task
#
# Return a string t having the following property:
#
# length t(O) <= length t(1) >= length t(2) <= length t(3) >= length t(4) .... (P)
#
# where the t(i) are the substring of s; you must respect the following rule:
#
# at each step from left to right, you can only move either already consecutive strings or strings that became consecutive after a previous move. The number of moves should be minimum.
#
# Let us go with our example:
#
# The length of "after" is greater than the length of "be". Let us move them ->"be after arrived two My so"
#
# The length of "after" is smaller than the length of "arrived". Let us move them -> "be arrived after two My so"
#
# The length of "after" is greater than the length of "two" ->"be arrived two after My so"
#
# The length of "after" is greater than the length of "My". Good! Finally the length of "My" and "so" are the same, nothing to do. At the end of the process, the substrings s(i) verify:
#
# length s(0) <= length s(1) >= length s(2) <= length s(3) >= length (s4) <= length (s5)
#
# Hence given a string s of substrings s(i) the function arrange with the previous process should return a unique string t having the property (P).
#
# It is kind of roller coaster or up and down. When you have property (P), to make the result more "up and down" visible t(0), t(2), ... will be lower cases and the others upper cases.
#
# arrange("after be arrived two My so") should return "be ARRIVED two AFTER my SO"
# Notes:
#
# The string "My after be arrived so two" has the property (P) but can't be obtained by the described process so it won't be accepted as a result. The property (P) doesn't give unicity by itself.
#     Process: go from left to right, move only consecutive strings when needed.
#     For the first fixed tests the needed number of moves to get property (P) is given as a comment so that you can know if your process follows the rule.
require_relative '../../metaprogramming/test/assertions'

def arrange(strng)
  old_arr = strng.split(" ")
  (0..old_arr.length-2).each do |k|
    if k.even?
      old_arr[k], old_arr[k+1] =  old_arr[k+1], old_arr[k] if old_arr[k].length > old_arr[k+1].length
    elsif k.odd?
      old_arr[k], old_arr[k+1] =  old_arr[k+1], old_arr[k] if old_arr[k].length < old_arr[k+1].length
    end
  end
  old_arr.map.with_index {|w, i| i.odd? ? w.upcase : w.downcase}.join(" ")
end

assert_equals(arrange(""), "")
assert_equals(arrange("who hit retaining The That a we taken"), "who RETAINING hit THAT a THE we TAKEN") # 3
assert_equals(arrange("on I came up were so grandmothers"), "i CAME on WERE up GRANDMOTHERS so") # 4
assert_equals(arrange("way the my wall them him"), "way THE my WALL him THEM") # 1
assert_equals(arrange("turn know great-aunts aunt look A to back"), "turn GREAT-AUNTS know AUNT a LOOK to BACK") # 2
assert_equals(arrange("on sacrum a traffic I supposed"), "on SACRUM a TRAFFIC i SUPPOSED") # 0
assert_equals(arrange("back were but the stay was"), "back WERE but STAY the WAS") # 1
assert_equals(arrange("Braslia Braslia Eventually He I If She The Then They Waiting With a able about"),
            "braslia EVENTUALLY he BRASLIA i SHE if THEN the WAITING they WITH a ABOUT able") # 6
