class Order
  attr_reader :id, :customer, :meal, :employee
  attr_writer :id
  def initialize(attributes = {})
    @id = attributes[:id].to_i
    @customer = attributes[:customer]
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered].to_s == "true"
  end

  def delivered?
    return @delivered
  end

  def deliver!
    @delivered = true
  end

  def headers
    ["id", "customer_id", "meal_id", "employee_id", "delivered"]
  end

  def build_row
    [@id, @customer.id, @meal.id, @employee.id, @delivered]
  end
end
