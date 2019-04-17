require_relative '../models/meal'
require_relative 'base_repository'
require 'csv'

class MealRepository < BaseRepository
  private

  def build_element(row)
    Meal.new(row)
  end
end
