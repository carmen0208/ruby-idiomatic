
def slugify(title)
  title.tr_s '^A-Za-z0-9', '-'
end
slugify "'Twas brillig, and the slithy toves..."

# semantic change(the addition of a call to #downcase) coupled with
# an incidental change(the addition of a pair of parentheses)---not good. 
def slugify(title)
  title.tr_s('^A-Za-z0-9', '-').downcase
end
slugify "'Twas brillig, and the slithy toves..."


