class MealsView
  def add_meal
    attributes = {}
    puts "Enter a name for your new meal:"
    attributes[:name] = gets.chomp
    puts "Enter a price for your new meal:"
    attributes[:price] = gets.chomp.to_i
    return attributes
  end

  def list_meals(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - £#{meal.price}"
    end
  end

  def ask_for_id_to_destroy
    puts "Enter the index of the meal you want to destroy"
    return gets.chomp.to_i
  end
end
