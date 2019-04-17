require_relative '../views/orders_view'
require 'pry'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @view = OrdersView.new
  end

  def list_undelivered_orders
    # Grab array of order instances
    orders = @order_repository.undelivered_orders
    # Give them to the view
    @view.list_undelivered_orders(orders)
  end

  def add
    # Get attributes from user
    attributes = @view.add_order
    # Set delivered to false
    attributes[:delivered] = false
    # Pull out the meal customer and employee from the other repos
    attributes[:meal] = @meal_repository.find(attributes[:meal_id].to_i)
    attributes[:customer] = @customer_repository.find(attributes[:customer_id].to_i)
    attributes[:employee] = @employee_repository.find(attributes[:employee_id].to_i)
    # Create new order
    new_order = Order.new(attributes)
    # Call the add method on the repository
    @order_repository.add(new_order)
  end

  def list_my_orders(employee_instance)
    # Grab array of order instances
    undelivered_orders = @order_repository.undelivered_orders
    # Filter by mine
    my_undelivered = undelivered_orders.select { |order| order.employee == employee_instance }
    @view.list_employees_undelivered_orders(my_undelivered)
    # Return it in case we need them
    return my_undelivered
  end

  def mark_as_delivered(employee_instance)
    # Get the undelivered orders to mark as delivered
    my_undelivered_orders = list_my_orders(employee_instance)
    # Ask which one to mark as delivered
    id = @view.ask_for_mark_delivered
    # Find it and mark delivered
    order_to_mark = my_undelivered_orders.find { |order| order.id == id }
    # If order found, mark delivered
    order_to_mark&.deliver!
    # Save repo to csv
    @order_repository.csv_save
  end
end
