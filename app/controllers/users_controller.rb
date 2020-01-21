class UsersController < ApplicationController
  before_action :set_users, only: [:show, :update, :destroy]

  def hmac_secret
    "secret_tag"
  end

  def index
    @users = User.all
    
    if @users
      render json: @users
    else
      render json: {
        status: 500,
        users: ["no users found"],
      }
    end
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      user = @user
      token = JWT.encode({ user_id: user.id }, hmac_secret, "HS256")
      render json: { user: user, token: token }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def update
    @user.update(user_params)
    render json: user
  end

  def destroy
    @user.destroy
  end

  private

  def set_users
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :username, :password)
  end
end
