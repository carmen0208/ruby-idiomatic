class C
  def get(*)
    "GET"
  end
end

r = Hash.new(C.new)
POSSBILE_VERBS = ['get', 'put', 'post', 'delete']

POSSBILE_VERBS.each do |m|
  define_method m do |path, *args, &b|
    r[path].send(m, *args, &b)
  end
end

require_relative "../test/assertions"
assert_equals get(1, 2) {}, "GET"
