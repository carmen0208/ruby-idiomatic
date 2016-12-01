### Matcher without String.scan

* [Example](041_string_scan1.rb)

* Useful Methods:
   * match & match_post, match_pre in Regex Pattern matcher 
   ```ruby
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
   EMAIL_PATTERN.match(text) #=> bob@example.com
   EMAIL_PATTERN.post_match #=> the rest of them
   )

   ```
## String Scan

* [example](041_string_scan2.rb)

