require 'CSV'
PersonalAccount = Struct.new(
  :first_name,
  :last_name,
  :email) do
  def display(r)
    r.name("#{first_name} #{last_name}")
    r.email(email)
  end
end

CorporateAccount = Struct.new(
  :company_name,
  :email,
  :tax_id) do
  def display(r)
    r.name(company_name)
    r.email(email)
    r.tax_id(tax_id)
  end
end
TrialAccount = Struct.new(:email) do 
  def display(r)
    r.name("Trial Account User")
    r.email(email)
  end
end

# CSVRender
class CSVRenderer
  def initialize(destination)
    @csv = CSV.new(destination)
  end

  def method_missing(name, value=nil)
    @csv << [name, value]
  end

end

pa = PersonalAccount.new("Tom","Servo", "tservo@example.org")
ca = CorporateAccount.new( "Yoyodyne", "john@example.org")
ta = TrialAccount.new("crooooow@example.org") 


renderer = CSVRenderer.new($stdout)
p pa.display(renderer) # => <#CSV io_type:$stdout encoding:UTF-8 lineno:2 col_sep:"," row_sep:"\n" quote_char:"\"">
p ca.display(renderer) # => <#CSV io_type:$stdout encoding:UTF-8 lineno:5 col_sep:"," row_sep:"\n" quote_char:"\"">
p ta.display(renderer) # => <#CSV io_type:$stdout encoding:UTF-8 lineno:7 col_sep:"," row_sep:"\n" quote_char:"\"">

class HtmlRenderer
  def method_missing(name,value=nil)
    #p name # => :name, :email, :name, :email, :tax_id, :name, :email
    instance_variable_set("@#{name}", value)
  end

  def render
    <<"END"
<div class="account vcard">
  <p>
    Account details for:
    <span class="email">#{@email}</span>
  </p>
  <p class="fn">#{@name}</p>
</div>
END
  end
end

renderer = HtmlRenderer.new
pa.display(renderer)
p renderer.render # => "<div class=\"account vcard\">\n  <p>\n    Account details for:\n    <span class=\"email\">tservo@example.org</span>\n  </p>\n  <p class=\"fn\">Tom Servo</p>\n</div>\n"
ca.display(renderer)
p renderer.render # => "<div class=\"account vcard\">\n  <p>\n    Account details for:\n    <span class=\"email\">john@example.org</span>\n  </p>\n  <p class=\"fn\">Yoyodyne</p>\n</div>\n"
ta.display(renderer)
p renderer.render # => "<div class=\"account vcard\">\n  <p>\n    Account details for:\n    <span class=\"email\">crooooow@example.org</span>\n  </p>\n  <p class=\"fn\">Trial Account User</p>\n</div>\n"

class SummaryAccountRenderer
  def method_missing(name, value=nil)
    #NOOP
  end
  def name name
    @name = name
  end
  def email email
    @email = email
  end

  def render
    "#{@name} < #{@email}"
  end
end


renderer = SummaryAccountRenderer.new
pa.display(renderer)
renderer.render # => "Tom Servo < tservo@example.org"
pa.display(renderer)
p renderer.render # => "Tom Servo < tservo@example.org"
ca.display(renderer)
p renderer.render # => "Yoyodyne < john@example.org"
ta.display(renderer)
# >> name,Tom Servo
# >> email,tservo@example.org
# >> <#CSV io_type:$stdout encoding:UTF-8 lineno:2 col_sep:"," row_sep:"\n" quote_char:"\"">
# >> name,Yoyodyne
# >> email,john@example.org
# >> tax_id,
# >> <#CSV io_type:$stdout encoding:UTF-8 lineno:5 col_sep:"," row_sep:"\n" quote_char:"\"">
# >> name,Trial Account User
# >> email,crooooow@example.org
# >> <#CSV io_type:$stdout encoding:UTF-8 lineno:7 col_sep:"," row_sep:"\n" quote_char:"\"">
# >> "<div class=\"account vcard\">\n  <p>\n    Account details for:\n    <span class=\"email\">tservo@example.org</span>\n  </p>\n  <p class=\"fn\">Tom Servo</p>\n</div>\n"
# >> "<div class=\"account vcard\">\n  <p>\n    Account details for:\n    <span class=\"email\">john@example.org</span>\n  </p>\n  <p class=\"fn\">Yoyodyne</p>\n</div>\n"
# >> "<div class=\"account vcard\">\n  <p>\n    Account details for:\n    <span class=\"email\">crooooow@example.org</span>\n  </p>\n  <p class=\"fn\">Trial Account User</p>\n</div>\n"
# >> "Tom Servo < tservo@example.org"
# >> "Yoyodyne < john@example.org"
