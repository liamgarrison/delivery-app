class Router
  def initialize(employee_repository, meals_controller, customers_controller, orders_controller, sessions_controller)
    @employee_repository = employee_repository
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @orders_controller = orders_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @employee = @sessions_controller.login
      while @employee
        if @employee.manager? then manager_action
        else delivery_guy_action
        end
      end
    end
  end

  # MANAGER ACTIONS

  def manager_action
    manager_ask_for_action
    manager_display_actions
    action = manager_get_action
    manager_food_actions(action)
    manager_other_actions(action)
  end

  def manager_ask_for_action
    puts "-----------------------------------------"
    puts "[MANAGER] What would you like to do next?"
  end

  def manager_display_actions
    puts "1.  Add a meal"
    puts "2.  List all meals"
    puts "3.  Delete a meal"
    puts "4.  Add a customer"
    puts "5.  List all customers"
    puts "6.  Delete a customer"
    puts "7.  View all undelivered orders"
    puts "8.  Add an order"
    puts "9.  Log out"
    puts "10. Exit the program"
  end

  def manager_get_action
    print "> "
    action = gets.chomp.to_i
    puts "-----------------------------------------"
    return action
  end

  def manager_food_actions(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @meals_controller.destroy
    when 4 then @customers_controller.add
    when 5 then @customers_controller.list
    when 6 then @customers_controller.destroy
    when 7 then @orders_controller.list_undelivered_orders
    when 8 then @orders_controller.add
    end
  end

  def manager_other_actions(action)
    case action
    when 9 then @employee = nil
    when 10 then exit_program
    end
  end

  # DELIVERY GUY ACTIONS

  def delivery_guy_action
    action = delivery_guy_ask_for_action
    delivery_guy_next_action(action)
  end

  def delivery_guy_ask_for_action
    puts "-----------------------------------------"
    puts "[DELIVERY GUY] What would you like to do next?"
    puts "1. View my undelivered orders"
    puts "2. Mark my orders as delivered"
    puts "3. Log out"
    puts "4. Exit the program"
    print "> "
    action = gets.chomp.to_i
    puts "-----------------------------------------"
    return action
  end

  def delivery_guy_next_action(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 3 then @employee = nil
    when 4 then exit_program
    end
  end

  def exit_program
    @employee = nil
    @running = false
  end
end
