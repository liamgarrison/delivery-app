require_relative '../models/customer'
require_relative 'base_repository'
require 'csv'

class CustomerRepository < BaseRepository
  private

  def build_element(row)
    Customer.new(row)
  end
end
