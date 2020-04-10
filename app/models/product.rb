class Product < ApplicationRecord

 belongs_to :user
 belongs_to :category
 belongs_to :brand
 has_one    :address
 has_many   :likes , dependent: :destroy
 has_many   :images

 
 def like_user(user_id)
  likes.find_by(user_id: user_id)
 end

end
