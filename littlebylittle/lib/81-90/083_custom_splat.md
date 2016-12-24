## NETRC file

  file location : ~/.netrc

## More meaningful object than an Array

  [Convert Struts to Array](083_custom_splat_struct.rb)

## implicit splatting with "array-like" object

* Define "array-like"

  Ruby makes this determination based on whether the object responds to the
  #to_ary method.

  [Convert Struts to Array](083_custom_splat_struct_convert.rb)

## What's the difference between to_a and to_ary?

`to_ary` is used for implicit conversions, while `to_a` is used for explict conversions.

[more info](http://stackoverflow.com/questions/9467395/whats-the-difference-between-to-a-and-to-ary)
