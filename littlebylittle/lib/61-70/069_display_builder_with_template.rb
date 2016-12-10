PersonalAccount = Struct.new(
  :first_name,
  :last_name,
  :email)

CorporateAccount = Struct.new(
  :company_name,
  :email,
  :tax_id)

TrialAccount = Struct.new(:email)
# this approach is resulting templates are very tightly bound 
# to a specific class of account. If we tried to pass a 
# CorporateAccount into a PersonalAccount view, it would blow 
# up because it doesn’t have first_name or last_name fields.
class HTMLPersonalAccountView
  TEMPLATE = ERB.new(<<END)
  <div class="account vcard">
    <p>
      Account details for:
      <span class="email"><%= email %></span>
    </p>
    <p class="fn"><%= first_name %><%= last_name %></p>
  </div>
  END

  def render(account)
    account.instance_eval do 
      TEMPLATE.run(binding)
    end
  end
end
