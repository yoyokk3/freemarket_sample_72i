class TopsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create, :category_children, :category_grandchildren]

  def index
    @products = Product.all.limit(3).order("id DESC")
  end
  
  def new
    @product = Product.new
    @product.images.new
    @category = Category.where(ancestry:nil)
  end

  def category_children
    @category_children = Category.find(params[:productcategory]).children 
  end

 
  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      redirect_to new_top_path
    end
  end
  
  def show
    @product.images
    
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
    @category = Category.where(ancestry:nil)

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
    if @product.user_id == current_user.id && @product.destroy
      redirect_to root_path 
    else
      render :edit
    end
  end


  private
  def product_params
    params.require(:product).permit(:name, :price, :status, :description, :sending,
                                    :sending_cost, :user_id, :categories_id, :brand_id,
                                    :exhibition_status,:purchaser_id,
                                    images_attributes: [:image, :_destroy, :id]).merge(user_id:current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end


  private

  def image_params
    params.require(:image).permit(:image)
  end
end
