class Customer
  attr_accessor :name, :address, :id
  def initialize(attributes)
    @name = attributes[:name].to_s
    @address = attributes[:address].to_s
    @id = attributes[:id].to_i
  end

  def headers
    ["id", "name", "address"]
  end

  def build_row
    [@id, @name, @address]
  end
end
