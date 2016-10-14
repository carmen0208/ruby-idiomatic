def slugify(title)
  title
    .strip
    .tr_s('^A-Za-z0-9', '-')
    .downcase
end

p slugify " Curioser and curioser"
