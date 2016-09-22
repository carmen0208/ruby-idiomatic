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
u.email_address = auth['info']['email']
u.first_name = auth['info']['first_name']
u.last_name = auth['info']['last_name']
u.token = auth['credentials']['token']

p greeting = "Good morning, #{u.first_name.capitalize}"
greeting # => 
# ~> -:4:in `<main>': undefined method `capitalize' for nil:Ni
