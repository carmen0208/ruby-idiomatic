## backtick(重音符号( "`" ))

####usage

```ruby
sysinfo = `uname -a`
sysinfo # => "Linux petronius 3.2.0-32-generic #51-Ubuntu SMP Wed Sep 26 21:33:09 UTC 2012 x86_64 x86_64 x86_64 GNU/Linux\n"

output = %x{finger `whoami`}
puts output

 #=>Login: carmenliu      			Name: Carmen Liu
 #=>Directory: /Users/carmenliu         	Shell: /bin/zsh
 #=>On since Thu Sep 29 05:04 (CST) on console, idle 13 days 6:09 (messages off)
 #=>On since Thu Sep 29 09:27 (CST) on ttys000, idle 11 days 19:41
 #=>On since Fri Sep 30 07:59 (CST) on ttys002, idle 11 days 19:42
 #=>On since Thu Sep 29 19:33 (CST) on ttys003, idle 7 days 3:58
 #=>On since Thu Sep 29 10:02 (CST) on ttys004, idle 7 days 3:58
 #=>On since Thu Sep 29 19:49 (CST) on ttys005
 #=>On since Tue Oct 11 14:25 (CST) on ttys006, idle 20:47
 #=>On since Fri Sep 30 14:01 (CST) on ttys007
 #=>On since Thu Oct  6 07:19 (CST) on ttys008 (messages off)
 #=>No Mail.
 #=>No Plan.
```

#### Rewrite backtick

```ruby
 alias old_backtick `
 def `(command)
  puts "Executing command: #{command}"
  puts old_backtick(command)
 end

 `uname -a`
 #=>Executing command: uname -a
 #=>Darwin abuckleyhp.active.local 15.6.0 Darwin Kernel Version 15.6.0: Mon Aug 29 20:21:34 PDT 2016; root:xnu-3248.60.11~1/RELEASE_X86_64 x86_64
 %x{uname -a}

 #=>Executing command: uname -a
 #=>Darwin abuckleyhp.active.local 15.6.0 Darwin Kernel Version 15.6.0: Mon Aug 29 20:21:34 PDT 2016; root:xnu-3248.60.11~1/RELEASE_X86_64 x86_64
```

#### Rewrite and Use it in other way
```ruby
require "net/http"
require 'cgi'

class Cowsays
  def `(url)
    URI.parse(url)
  end

  def say(message)
    message = CGI.escape(message)
    Net::HTTP.get_print(`http://www.cowsays.com/cowsay?message=#{message}`)
  end
end

Cowsays.new.say "Hello, Ruby !"

#=>  _______________
#=> < Hello, Ruby ! >
#=>  ---------------
#=>         \   ^__^
#=>          \  (oo)\_______
#=>             (__)\       )\/\
#=>                 ||----w |
#=>                 ||     ||
```

#### Knowledge

* URI.escape: URL-encode a string

```ruby
url_encoded_string = CGI::escape("'Stop!' said Fred")
   # => "%27Stop%21%27+said+Fred"
```

* Net::HTTP.get_print

get_print(uri_or_host, path = nil, port = nil) click to toggle source
Gets the body text from the target and outputs it to $stdout. The target can either be specified as (uri), or as (host, path, port = 80); 


