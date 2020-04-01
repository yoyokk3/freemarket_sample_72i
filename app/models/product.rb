class Product < ApplicationRecord

 belongs_to :user
 belongs_to :category
 belongs_to :brand
 has_one    :address
 has_many   :likes
 has_many   :images
end
