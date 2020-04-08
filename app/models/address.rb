class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :first_name, presence: true ,format: { with: /\A[一-龥ぁ-ん]/}
  validates :last_name, presence: true ,format: { with: /\A[一-龥ぁ-ん]/ }
  validates :first_name_kana, presence: true ,format: { with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana, presence: true ,format: { with: /\A[ァ-ヶー－]+\z/}
  validates :postal_code, presence: true
  validates :prefectures, presence: true
  validates :municipality, presence: true
  validates :house_number, presence: true
  
end
