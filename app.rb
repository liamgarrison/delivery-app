require_relative "router"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/orders_controller"
require_relative "app/repositories/order_repository"
require_relative "app/controllers/sessions_controller"
require_relative "app/repositories/employee_repository"

# Set up the employee repository for login purposes
employee_repository = EmployeeRepository.new("./data/employees.csv")
meal_repository = MealRepository.new("./data/meals.csv")
customer_repository = CustomerRepository.new("./data/customers.csv")
order_repository = OrderRepository.new("./data/orders.csv", meal_repository, employee_repository, customer_repository)

# Set up the meals controller
meals_controller = MealsController.new(meal_repository)

# Set up the customers controller
customers_controller = CustomersController.new(customer_repository)

# Set up the orders controller
orders_controller = OrdersController.new(
  meal_repository, employee_repository, customer_repository, order_repository
)

# Set up the sessions controller with the employee repo
sessions_controller = SessionsController.new(employee_repository)

# Initialize routers with controllers
router = Router.new(employee_repository, meals_controller, customers_controller, orders_controller, sessions_controller)

# Run program
router.run


