class UserController < ApplicationController

  def index
    # @users = User.all
  end

  def show
    # @user = User.find(params[:id])
  end

  def new
    # @user = User.new
  end

  def create
    # debugger
    # @user = User.new(user_params)
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
  end

  def destroy
    # @user = User.find(params[:id])
    # @user.destroy

    # redirect_to root_path, status: :see_other
  end

  private
    # def user_params
    #   params.require(:user).permit(:email, :password, :status)
    # end
    def form_params
      params.permit(:email, :password, :status)
    end
end