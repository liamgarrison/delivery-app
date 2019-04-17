class Employee
  attr_accessor :id, :username, :password, :role
  def initialize(attributes = {})
    @id = attributes[:id].to_i
    @username = attributes[:username].to_s
    @password = attributes[:password].to_s
    @role = attributes[:role].to_s
  end

  def manager?
    @role == "manager"
  end

  def delivery_guy?
    @role == "delivery_guy"
  end

  def headers
    ["id", "username", "password", "role"]
  end

  def build_row
    [@id, @username, @password, @role]
  end
end
