require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    # Grab array of customer instances
    customers = @customer_repository.all
    # Give them to the view
    @view.list_customers(customers)
  end

  def add
    # Get attributes from user
    attributes = @view.add_customer
    # Create new customer
    new_customer = Customer.new(attributes)
    # Call the add method on the repository
    @customer_repository.add(new_customer)
  end

  def destroy
    id = @view.ask_for_id_to_destroy
    @customer_repository.destroy(id)
  end
end
