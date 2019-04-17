require_relative '../models/employee'
require_relative 'base_repository'
require 'csv'

class EmployeeRepository < BaseRepository
  def all_delivery_guys
    # Call the all method
    all_employees = all

    # Select only employees who are delivery guys
    all_employees.select { |employee| employee.role == "delivery_guy" }
  end

  def find_by_username(username)
    # Call the all method
    all_employees = all

    all_employees.find { |employee| employee.username == username }
  end

  private

  def build_element(row)
    Employee.new(row)
  end

  # Don't allow access to parent methods:
  undef_method :add
end
