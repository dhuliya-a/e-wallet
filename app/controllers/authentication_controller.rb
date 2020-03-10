
class AuthenticationController < ApplicationController

  skip_before_action :authorize_request, only: :login

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    raise ValidationError.new, "Incorrect password" if !@user.authenticate(params[:password])

    token = JsonWebToken.encode(user_id: @user.id)
    REDIS.set("auth_#{@user.id}", token)
  end


  # POST /auth/logout
  def logout
    @current_user.logout(@current_user.id)
  end

  private

  def login_params
    params.permit(:email, :password)
  end

end
