class V1::UsersController < ApplicationController
  before_action :authenticate_user, except: :create

  def index
    render json: User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:handle, :email,
                                 :password, :password_confirmation)
  end
end
