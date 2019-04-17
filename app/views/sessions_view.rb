class SessionsView
  def ask_for_username
    # Get the username from employee
    print "Enter Username:\n> "
    return gets.chomp
  end

  def ask_for_password
    # Ask for password
    print "Enter Password:\n> "
    return gets.chomp
  end

  def incorrect_credentials
    puts "Wrong credentials... Try again!"
  end
end
