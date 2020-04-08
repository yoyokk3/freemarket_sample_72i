class PurchasesController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def  done
    @product_purchaser= Product.find(params[:id])
    @product_purchaser.update( purchaser_id: current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:first_name)
  end
end
