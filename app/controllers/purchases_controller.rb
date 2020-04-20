class PurchasesController < ApplicationController
  require 'payjp'#Payjpの読み込み
  before_action :set_card, :set_item

  def new
    @user = User.new
  end

  def index
    if @card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id) 
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
      :amount => @product.price,
      :customer => @card.customer_id,
      :currency => 'jpy',
    )
    redirect_to done_product_purchases_path
  end


  def create
    User.create(user_params)
  end


  def  done
    #   @product = Product.find(params[:id])
    #   @product.update( purchaser_id: current_user.id)
    # rescue ActiveRecord::RecordNotFound => e
    #   redirect_to :root, alert: '購入に失敗しました'
  end

  private
  def user_params
    params.require(:user).permit(:first_name)
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_item
    @product = Product.find(params[:product_id])
  end

end
