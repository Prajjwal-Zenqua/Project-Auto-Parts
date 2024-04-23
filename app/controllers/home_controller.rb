class HomeController < ApplicationController  
  before_action :authenticate_user!
  
  def index
    # debugger
    render
  end
  def create
    debugger
    # @user = User.new(user_params)
  end

  private
  # def user_params
  #   params.require(:user).permit(:email, :password, :status)
  # end
  def form_params
    params.permit(:email, :password, :status)
  end
end
