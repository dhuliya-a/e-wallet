class UsersController < ApplicationController

  before_action :authorize_request, except: :create
  before_action :validate_user, only: [:show, :update, :destroy]

  attr_reader :new_user

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/{username}
  def show

  end

  # POST /users
  def create
    raise ValidationError.new "User already exists" if User.find_by_username(user_params[:username]).present?
    raise ValidationError.new "User already exists" if User.find_by_email(user_params[:email]).present?

    current_user = User.create!(user_params)
    WalletWorker.perform_async(current_user.id)

    render json: current_user
  end

  # PUT /users/{username}
  def update
    raise ValidationError.new, "Username is not available" if User.find_by_username(user_params[:username]).present?
    current_user.update!(user_params)
  end

  # DELETE /users/{username}
  def destroy
    current_user.destroy
  end

  private

  def validate_user
    raise ValidationError.new, "Not authorized" if current_user.id != User.find_by!(username: params[:username]).id
  end

  def user_params
    params.permit(:name, :username, :email, :password, :password_confirmation, :phone)
  end
end
