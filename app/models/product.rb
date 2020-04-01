class Product < ApplicationRecord

  enum status:[:brand_new, :very_good, :good]

 belongs_to :user
 belongs_to :category
 belongs_to :brand
 belongs_to :address
 has_many   :likes
 has_many   :images
end
