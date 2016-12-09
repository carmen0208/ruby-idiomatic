def longest_common_prefix(strs)
  return '' if (strs.empty? || strs[0].empty?)
  if strs.size == 1
    return strs[0]
  end
  base_str = strs[0]
  num = 0
  strs[0].chars.each_with_index do |char, idx|
    break if strs[1..-1].any? {|str| str[idx] != char}
    num += 1
  end
  p strs[0].slice(0,num)
end

longest_common_prefix(["a", "b"])