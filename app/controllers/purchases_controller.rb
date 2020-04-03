class PurchasesController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:first_name)
  end
end
