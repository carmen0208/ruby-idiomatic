###Previous version 

From [Method and Message](011_method_and_message.md), we got the idea that
sending message and call the message is a better solution than passing method
because it could be updated.

The message-sending version is coupled to the notifier collaborator by
connascence of name. This is a fairly benign(/bɪ'naɪn/
良性的；吉利的；和蔼的，亲切的(比 耐)) form of coupling

Nonetheless, sometimes we would like an extral level of **indirection**

To make this possbile, we apply the Pluggable Selector pattern described in
Smalltalk Best Practice Patterns.

For Example:

* How to add those notifier without add more classes
  
  ```ruby
  class StdioUi
    def notify(text)
      puts text
    end
  end
  ```
  [Example](019_pluggable_selector.rb)
  [Example](019_pluggable_selector_change.rb)

* Here's an other version of pluggable


  [Example](019_pluggable_selector_version2.rb)


  There's an old saying that you can fix any problem with another layor of
  indirection, except for the problem of too much indirection. 

  Pluggable Selector adds a layer of indirection which ,in most cases, would be
  overkill. But it's occasionally a useful tool for loosening the coupling
  between collaborators or for doing impedence-matching between codebases.




