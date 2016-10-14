
###How to get Home path from ruby code

```ruby
Dir.home
#=> "/Users/carmenliu"
```

###Home to make it impossible

```ruby
ENV.delete('HOME')
Dir.home
#=>ArgumentError: couldn't find HOME environment -
```

###Making it possible again
```ruby
require 'etc'

user = Etc.getlogin #=>'carmenliu'
Dir.home(Dir.home(user)
#=> "/home/carmenliu"
config_file = File.join(Dir.home(user), ".rvm") 
# => "/home/carmenliu/.rvm"

```


####Other usage of Dir

Dir: Objects of class Dir are directory streams representing directories in the underlying file system. They provide a variety of ways to list directories and their contents. See also File.

more info: Dash Dir


```ruby
Dir.pwd #=> "/Users/carmenliu/Work/workspaces-new(201606)/Learn/Ninja Code/Ruby/ruby-idiomatic"
Dir.foreach("testdir") {|x| puts "Got #{x}" }
Dir.chdir("/tmp") do
  puts Dir.pwd
  Dir.chdir("/usr") do
    puts Dir.pwd
  end
  puts Dir.pwd
end
```

####Other usage of Etc

The Etc module provides access to information typically stored in files in the /etc directory on Unix systems.

The information accessible consists of the information found in the /etc/passwd and /etc/group files, plus information about the system’s temporary directory (/tmp) and configuration directory (/etc).

The Etc module provides a more reliable way to access information about the logged in user than environment variables such as +$USER+.

more info :Dash Etc

```ruby
login = Etc.getlogin
info = Etc.getpwnam(login)
# => #<struct Etc::Passwd name="carmenliu", passwd="********", uid=502, gid=20, gecos="Carmen Liu", dir="/Users/carmenliu", shell="/bin/zsh", change=0, uclass="", expire=0>
username = info.gecos.split(/,/).first
# => "Carmen Liu"
```
####About ENV

ENV is a hash-like accessor for environment variables.

moreinfo: dash ENV
```ruby
ENV
# => {"TERM_SESSION_ID"=>"w0t1p2:E83A1913-491C-4068-AF62-03DFD14C25BA",
# "SSH_AUTH_SOCK"=>"/private/tmp/com.apple.launchd.yvg5NZ00MK/Listeners",
# "Apple_PubSub_Socket_Render"=>"/private/tmp/com.apple.launchd.rySdSkKtcc/Render",
# "COLORFGBG"=>"15;0", "ITERM_PROFILE"=>"Hotkey Window", "XPC_FLAGS"=>"0x0",
# "PWD"=>"/Users/carmenliu/Work/workspaces-new(201606)/Learn/Ninja
# Code/Ruby/ruby-idiomatic", "SHELL"=>"/bin/zsh", "SECURITYSESSIONID"=>"186a9",
# "TERM_PROGRAM_VERSION"=>"3.0.10", "TERM_PROGRAM"=>"iTerm.app",
# "PATH"=>"/usr/local/heroku/bin:/Users/carmenliu/.rvm/gems/ruby-2.1.2/bin:/Users/carmenliu/.rvm/gems/ruby-2.1.2@global/bin:/Users/carmenliu/.rvm/rubies/ruby-2.1.2/bin:/Users/carmenliu/.nvm/versions/node/v6.3.0/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/carmenliu/.rvm/bin",
# "TERM"=>"xterm-256color",
# "TMPDIR"=>"/var/folders/j3/x7fj5c8j3hxb9t0xl66s7k0m0000gp/T/",
# "USER"=>"carmenliu", "XPC_SERVICE_NAME"=>"0", "LOGNAME"=>"carmenliu",
# "ITERM_SESSION_ID"=>"w0t1p2:E83A1913-491C-4068-AF62-03DFD14C25BA",
# "__CF_USER_TEXT_ENCODING"=>"0x1F6:0x0:0x0", "SHLVL"=>"1",
# "OLDPWD"=>"/Users/carmenliu/Work/workspaces-new(201606)/Learn/Ninja
# Code/Ruby/ruby-idiomatic", "ZSH"=>"/Users/carmenliu/.oh-my-zsh",
# "PAGER"=>"less", "LESS"=>"-R", "LSCOLORS"=>"Gxfxcxdxbxegedabagacad",
# "AUTOJUMP_DATA_DIR"=>"/Users/carmenliu/.local/share/autojump",
# "LC_CTYPE"=>"UTF-8", "LC_ALL"=>"en_US.UTF-8", "LANG"=>"en_US.UTF-8",
# "NVM_DIR"=>"/Users/carmenliu/.nvm",
# "NVM_NODEJS_ORG_MIRROR"=>"https://nodejs.org/dist",
# "NVM_IOJS_ORG_MIRROR"=>"https://iojs.org/dist",
# "MANPATH"=>"/Users/carmenliu/.nvm/versions/node/v6.3.0/share/man:/usr/share/man:/usr/local/share/man:/Users/carmenliu/.rvm/share/man:/Applications/Xcode.app/Contents/Developer/usr/share/man:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/share/man",
# "NVM_PATH"=>"/Users/carmenliu/.nvm/versions/node/v6.3.0/lib/node",
# "NVM_BIN"=>"/Users/carmenliu/.nvm/versions/node/v6.3.0/bin",
# "PROMPT"=>"%{%f%b%k%}$(build_prompt) +\\n\xE2\x88\xB4 ",
# "rvm_prefix"=>"/Users/carmenliu", "rvm_path"=>"/Users/carmenliu/.rvm",
# "rvm_bin_path"=>"/Users/carmenliu/.rvm/bin", "_system_type"=>"Darwin",
# "_system_name"=>"OSX",..........
```
