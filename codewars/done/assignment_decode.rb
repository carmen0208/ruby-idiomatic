# Description:
#
#     Third day at your new cryptoanalyst job and you come across your toughest assignment yet. Your job is to implement a simple keyword cipher. A keyword cipher is a type of monoalphabetic substitution where two parameters are provided as such (string, keyword). The string is encrypted by taking the keyword, dropping any letters that appear more than once. The rest of the letters of the alphabet that aren't used are then appended to the end of the keyword.
#
# For example, if your string was "hello" and your keyword was "wednesday", your encryption key would be 'wednsaybcfghijklmopqrtuvxz'.
#
# To encrypt 'hello' you'd substitute as follows,
#
#             abcdefghijklmnopqrstuvwxyz
# hello ==>   |||||||||||||||||||||||||| ==> bshhk
#             wednsaybcfghijklmopqrtuvxz
# hello encrypts into bshhk with the keyword wednesday. This cipher also uses lower case letters only.


require_relative '../../metaprogramming/test/assertions'


# My solution


# def keyword_cipher(string, keyword)
#   orignial = "abcdefghijklmnopqrstuvwxyz".split(//)
#
#   decode = keyword.split(//).uniq + (orignial - keyword.split(//).uniq)
#
#   matcher = Hash[orignial.each.zip(decode)]
#
#   result_array = string.downcase.split(//).map do |char|
#     if matcher[char].nil?
#       char = " "
#     else
#       char = matcher[char]
#     end
#   end
#   result_array.join
# end
#better solution

def keyword_cipher(string, keyword)
  alpha ="abcdefghijklmnopqrstuvwxyz"
  cipher= (keyword+alpha).chars.uniq.join
  string.downcase.tr(alpha, cipher)
end

# Learned from Better solution:
# * once we uniq, we can add it together to uniq(that's a brain training ad familization of methods of the list)
# * String.tr
# tr(from_str, to_str) => new_str click to toggle source
# Returns a copy of str with the characters in from_str replaced by the corresponding characters in to_str. If to_str is shorter than from_str, it is padded with its last character in order to maintain the correspondence."hello".tr('el', 'ip')      #=> "hippo"
# "hello".tr('aeiou', '*')    #=> "h*ll*"
# "hello".tr('aeiou', 'AA*')  #=> "hAll*"
# "hello".tr('a-y', 'b-z')    #=> "ifmmp"
# "hello".tr('^aeiou', '*')   #=> "*e**o"

assert_equals(keyword_cipher("Welcome home","secret"), 'wticljt dljt')
assert_equals(keyword_cipher("hello","wednesday"), 'bshhk')
assert_equals(keyword_cipher("HELLO","wednesday"), 'bshhk')
assert_equals(keyword_cipher("HeLlO","wednesday"), 'bshhk')
assert_equals(keyword_cipher("WELCOME HOME", "gridlocked"), 'wlfimhl kmhl')
assert_equals(keyword_cipher("alpha bravo charlie", "delta"), 'djofd eqdvn lfdqjga')
assert_equals(keyword_cipher("Home Base", "seven"), 'dlja esqa')
assert_equals(keyword_cipher("basecamp", "covert"), 'ocprvcil')
assert_equals(keyword_cipher("one two three", "rails"), 'mks twm tdpss')
assert_equals(keyword_cipher("Test", "unbuntu"), 'raqr')