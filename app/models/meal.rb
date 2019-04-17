class Meal
  attr_accessor :name, :price, :id
  def initialize(attributes = {})
    @name = attributes[:name].to_s
    @price = attributes[:price].to_i
    @id = attributes[:id].to_i
  end

  def headers
    ["id", "name", "price"]
  end

  def build_row
    [@id, @name, @price]
  end
end
