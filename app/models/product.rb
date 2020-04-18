class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping

#  belongs_to :user
#  belongs_to :category
#  belongs_to :brand
 has_many   :comments
 has_one    :address
 has_many   :likes
 has_many   :images, dependent: :destroy
 accepts_nested_attributes_for :images, allow_destroy: true

 validates :name, :description, :price, :status, :sending,  presence: true
end
