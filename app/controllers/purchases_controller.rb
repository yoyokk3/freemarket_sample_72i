class PurchasesController < ApplicationController

  before_action :authenticate_user!, only:[:destroy,:edit,:update]

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def show
  end

  def edit
    @product = Product.find(params[:id])
    @images = @product.images.order(id: "DESC")
  end


  def destroy
    @product.destroy if @product.user_id == current_user.id
    redirect_to(root_path, notice: '商品を削除しました')
  end

  def  done
      @product = Product.find(params[:id])
      @product.update( purchaser_id: current_user.id)
    rescue ActiveRecord::RecordNotFound => e
      redirect_to :root, alert: '購入に失敗しました'
  end

  private
  def user_params
    params.require(:user).permit(:first_name)
  end

  
  def set_products
    @product = Product.find(params[:id])
  end

end
