class Product < ApplicationRecord

 belongs_to :user
 belongs_to :category
 belongs_to :brans
 belongs_to :address
 has_many   :likes
 has_many   :images
end
