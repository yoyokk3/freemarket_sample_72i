# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery except: :create
  def new
    @user = User.new
    @user.build_address
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render action: :new
    end

    

    
  end

  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday_year, :birthday_manth, :birthday_day, address_attributes: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :prefectures, :municipality, :house_number, :apartment_name, :call_number])
  end

end
