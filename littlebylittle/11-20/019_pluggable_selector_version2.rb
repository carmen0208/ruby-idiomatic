Product = Struct.new(:short_name, :long_name)

products = [
  Product.new("JonGldApl", "Jonagold apples from our own orchard"),
  Product.new("PchTrnvr", "Fresh-baked peach turnovers"),
  Product.new("TrkBrs",   "Turkey bruschetta panini")
]

ProductListPresenter = Struct.new(:products, :show_message) do 
  def render
    "".tap do |s|
      s << "<ul class='product_list'>\n"
      products.each do |product|
        s << "<li> #{product.public_send(show_message)}</li>\n"
      end
      s << "</ul>\n"
    end
  end
end

puts ProductListPresenter.new(products, :short_name).render

# <ul class='product_list'>
# <li> JonGldApl</li>
# <li> PchTrnvr</li>
# <li> TrkBrs</li>
# </ul>

puts ProductListPresenter.new(products, :long_name).render

# <ul class='product_list'>
# <li> Jonagold apples from our own orchard</li>
# <li> Fresh-baked peach turnovers</li>
# <li> Turkey bruschetta panini</li>
# </ul>
