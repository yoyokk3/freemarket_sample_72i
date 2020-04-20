class ProductsController < ApplicationController

def edit
  @product= Product.find(params[:id])
  @images = @product.images.order(id: "DESC")
  @category = Category.all
end

end
