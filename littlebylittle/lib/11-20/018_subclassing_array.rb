class TagList < Array
  def << (tag)
 #2.1.2 :001 > "foo".to_s
 #=> "foo"
 #2.1.2 :002 > "foo".to_s.strip
 # => "foo"
 #2.1.2 :003 > "foo".to_s.strip.split
 # => ["foo"]
    tag.to_s.strip.split.each do |t|
      super(t)
    end
    self
  end

  def to_s
    join(" ")
  end
end

tags = TagList.new
tags << "foo" << "bar" << "baz buz"
p tags.to_s #=> "foo bar baz buz"
p tags.grep(/b/) #=> ["bar","baz","buz"]

#p a = Array.new(%w[apple banana]).to_s
tl1 = TagList.new(%w[apple banana])
p tl1
tl2 = TagList.new(%w[peach pear])
p tl2
tl3 = tl1 + tl2
p tl3.to_s #=>"[\"apple\", \"banana\", \"peach\", \"pear\"]" 
p tl3.class #=>Array
