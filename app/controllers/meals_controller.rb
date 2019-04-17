require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    # Grab array of meal instances
    meals = @meal_repository.all
    # Give them to the view
    @view.list_meals(meals)
  end

  def add
    # Get attributes from user
    attributes = @view.add_meal
    # Create new meal
    new_meal = Meal.new(attributes)
    # Call the add method on the repository
    @meal_repository.add(new_meal)
  end

  def destroy
    id = @view.ask_for_id_to_destroy
    @meal_repository.destroy(id)
  end
end
