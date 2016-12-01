text = <<END
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec
hendrerit tempor bob@example.com tellus. Donec pretium posuere
tellus. Proin quam nisl, tincidunt et, mattis eget, convallis nec,
purus. Cum sociis natoque penatibus et magnis dis parturient montes,
nascetur sue@example.org ridiculus mus. Nulla posuere. Donec vitae
dolor. Nullam tristique contact@shiprise.net diam non turpis. Cras
placerat accumsan nulla. Nullam president@whitehouse.gov rutrum. Nam
vestibulum accumsan nisl.
END

EMAIL_PATTERN = /\S+@\S+/i

email_list = []

kk = EMAIL_PATTERN.match(text)
#puts kk
#puts kk.post_match
while ( match = EMAIL_PATTERN.match(text))
  email_list << match[0]
  text = match.post_match
end

p email_list
#=>["bob@example.com", "sue@example.org", "contact@shiprise.net", "president@whitehouse.gov"]
