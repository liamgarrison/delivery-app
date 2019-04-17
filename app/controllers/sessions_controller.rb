require_relative '../views/sessions_view'
require 'bcrypt'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def login
    username = @view.ask_for_username
    password = @view.ask_for_password
    # Find right employee
    @employee = @employee_repository.find_by_username(username)
    if @employee && unhash(@employee.password) == password
      return @employee
    else
      @view.incorrect_credentials
      login
    end
  end

  private

  def unhash(password)
    BCrypt::Password.new(password)
  end
end
