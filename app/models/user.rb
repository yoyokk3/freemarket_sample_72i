class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
validates :nickname, presence: true
validates :first_name, presence: true ,format: { with: /\A[一-龥ぁ-ん]/}
validates :last_name, presence: true ,format: { with: /\A[一-龥ぁ-ん]/ }
validates :first_name_kana, presence: true ,format: { with: /\A[ァ-ヶー－]+\z/}
validates :last_name_kana, presence: true ,format: { with: /\A[ァ-ヶー－]+\z/}
validates :birthday_year, presence: true
validates :birthday_manth, presence: true
validates :birthday_day, presence: true


has_one  :card
has_many :likes
has_many :products
has_one  :address, dependent: :destroy
accepts_nested_attributes_for :address
end
