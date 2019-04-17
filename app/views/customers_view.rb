class CustomersView
  def add_customer
    attributes = {}
    puts "Enter a name for your new customer:"
    attributes[:name] = gets.chomp
    puts "Enter an address for your new customer:"
    attributes[:address] = gets.chomp
    return attributes
  end

  def list_customers(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end

  def ask_for_id_to_destroy
    puts "Enter the index of the customer you want to destroy"
    return gets.chomp.to_i
  end
end
