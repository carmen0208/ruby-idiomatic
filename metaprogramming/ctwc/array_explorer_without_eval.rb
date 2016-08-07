def explore_array(method, *arguments)
  ['a', 'b', 'c'].send(method, *arguments)
end

p explore_array(:find_index, "b")
