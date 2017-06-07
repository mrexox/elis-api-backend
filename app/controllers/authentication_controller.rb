class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # First you need to make a POST request like
  # POST {"login":"it's me", "password":"password!"} http://.../authenticate
  # Then you'll get a JSON: {"auth_token": "blahblah..."}
  # This token is used for every request to any of the admin/ actions

  def authenticate
    command = AuthenticateUser.call(params[:login], params[:password])
    if command.success?
      render json: {auth_token: command.result}
    else
      render json: {error: command.errors}, status: :unauthorized
    end
  end

  private 

end
