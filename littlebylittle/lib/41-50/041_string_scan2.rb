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

#1 the first way to do that
email_list = text.scan(EMAIL_PATTERN)
p email_list
#=>["bob@example.com", "sue@example.org", "contact@shiprise.net", "president@whitehouse.gov"]

#2. the second way to do that
text.scan(EMAIL_PATTERN) do |email| 
  puts email
end

EMAIL_PATTERN2 = /(\S+)@(\S+)/i
#3. super modification
text.scan(EMAIL_PATTERN2) do |name, host|
  puts "name: #{name}, hosts:#{host}"
end
