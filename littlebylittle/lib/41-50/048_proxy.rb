class MemoizeProxy
  def initialize(real_object)
    @real_object = real_object
  end

  def anagrams_for(dict_path)
    ## doing the memoize thing.......
    @real_object.anagrams_for(dict_path)
  end
end
