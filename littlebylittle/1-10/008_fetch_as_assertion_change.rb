
#Omniauth-style-hash
auth = {
  'uid' => 12345,
  'info' => {
    'email' => '13770576@qq.com',
   # 'first_name' => 'carmen',
    'last_name'  => 'liu'
  },
  'credentials' => {
    'token' => "TOKEN123"
  }
}

User = Struct.new(:email_address, :first_name, :last_name, :token)

u = User.new
# A tedious way to insure :
#u.email_address = auth['info']['email'] or raise ArgumentError
# more concise and idiomatic way to make sure it presence.
u.email_address = auth['info'].fetch('email')
u.first_name = auth['info'].fetch('first_name')
u.last_name = auth['info'].fetch('last_name')
u.token = auth.fetch('credentials').fetch('token')

p greeting = "Good morning, #{u.first_name.capitalize}"
greeting #=>in `fetch': key not found: "first_name" (KeyError)
       	# from 008_fetch_as_assertion_change.rb:22:in `<main>' 

Dir.home

ENV.delete('HOME')

require 'etc'

user = Etc.getlogin #=>'carmenliu'