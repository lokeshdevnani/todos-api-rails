# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  # return a token once the user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  def auth_params
    params.permit(:email, :password)
  end
end
