f = open('071-break-with-value.org')
f.lines.detect do |line|
  break "<Line Not Found>" if f.lineno >= 100
    line =~ /banana/
  end
end

# In that case, Lin Not Found would be show if it been break in 1000 line and
# didn't find any result match banana!!!
