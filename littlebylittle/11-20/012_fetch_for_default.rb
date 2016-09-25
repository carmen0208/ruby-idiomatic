auth = {
  'uid' => 1234,
  'info' => {
  }
}

#email_address = auth['info'].fetch('email')
# ~> -:11:in `fetch': key not found: "email" (KeyError)
# ~>    from -:11:in `<main>'

# Better Infos can be provided.
#auth['info'].fetch('email') do 
#  raise "Invalid autho data(missing email)"\
#    "See https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema"
#end

#email_address = auth['info'].fetch('email')
# ~> -:10:in `block in <main>': Invalid auth data (missing email).See https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema (RuntimeError)
# ~>    from -:8:in `fetch'
# ~>    from -:8:in `<main>'

email_address = auth['info'].fetch('email') {'anonymous@example.com'}
p email_address
