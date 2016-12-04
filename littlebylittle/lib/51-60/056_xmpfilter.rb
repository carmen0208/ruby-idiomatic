2 + 2  # => 4
Beer = Struct.new(:brewery, :name, :abv, :ipu)
hopback = Beer.new("Troegs", "Hopback Amber Ale", "6.0%", 55 )
hopback
 # => #<struct Beer
 #     brewery="Troegs",
 #     name="Hopback Amber Ale",
 #     abv="6.0%",
 #     ipu=55>
