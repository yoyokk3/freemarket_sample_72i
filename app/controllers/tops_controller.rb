class TopsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = Product.all.limit(3).order("id DESC")
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :update
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :price, :status, :description, :sending,
                                    :sending_cost, :user_id, :category_id, :brand_id,
                                    :exhibition_status,
                                    images_attributes: [:image, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
