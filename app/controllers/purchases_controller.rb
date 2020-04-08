class PurchasesController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def  done
      @Product_purchaser= Product.find(params[:id])
      @Product_purchaser.update( purchaser_id: current_user.id)
    rescue ActiveRecord::RecordNotFound => e
      redirect_to :root, alert: '購入に失敗しました'
  end

  private
  def user_params
    params.require(:user).permit(:first_name)
  end
end
