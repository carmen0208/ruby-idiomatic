Beer = Struct.new(:brewery, :name, :abv, :ibu) do
  def self.from_hash(attributes)
    instance = self.new
    attributes.each do |key, value|
      instance[key] = value
    end
    instance
  end

  def attributes
    result ={}
    members.each do |name|
      result[name] = self[name]
    end
    result
  end
end

hopback = Beer.from_hash(
  brewery: "Troegs",
  name: "Hopback Amber Ale",
  abv: 6.0,
  ibu: 55)
puts hopback.attributes
#=>{:brewery=>"Troegs", :name=>"Hopback Amber Ale", :abv=>6.0, :ibu=>55}
