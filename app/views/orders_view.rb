class OrdersView
  def list_undelivered_orders(orders)
    orders.each do |order|
      puts "Meal:#{order.meal.name}
      Employee: #{order.employee.username}
      Customer: #{order.customer.name}
      #{order.customer.address}"
    end
  end

  def add_order
    attributes = {}
    puts "Enter a meal id:"
    attributes[:meal_id] = gets.chomp.to_i
    puts "Enter a customer id"
    attributes[:customer_id] = gets.chomp.to_i
    puts "Enter an employee id:"
    attributes[:employee_id] = gets.chomp.to_i
    return attributes
  end

  def list_employees_undelivered_orders(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.customer.name} - #{order.meal.name}"
    end
  end

  def ask_for_mark_delivered
    puts "Which order would you like to mark delivered?"
    return gets.chomp.to_i
  end
end
