class AuthenticateUser
  prepend SimpleCommand

  def initialize(login, password)
    @login = login
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: admin_user.id) if admin_user
  end

  private 

  attr_accessor :login, :password

  def admin_user
    user = AdminUser.find_by_login(login)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end 
