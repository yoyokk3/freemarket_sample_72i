class TopsController < ApplicationController

  def index
  end

  def new
    @products = Product.new
    @contents = ["マイページ","お知らせ","いいね一覧","出品する","出品した商品"]
  end

  def create
  end

  def show
    @product = Product.find(params[:id])
    @image =Image.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def products_params
    params.require(:product).permit(:name, :price, :status, :description, :send_cost, :user_id, :category_id, :brand_id )
  end

  def image_params
    params.require(:image).permit(:image)
  end
end
