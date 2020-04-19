class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable , :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
validates :nickname, presence: true
validates :first_name, presence: true ,format: { with: /\A[一-龥ぁ-ん]/}
validates :last_name, presence: true ,format: { with: /\A[一-龥ぁ-ん]/ }
validates :first_name_kana, presence: true ,format: { with: /\A[ァ-ヶー－]+\z/}
validates :last_name_kana, presence: true ,format: { with: /\A[ァ-ヶー－]+\z/}
validates :birthday_year, presence: true
validates :birthday_manth, presence: true
validates :birthday_day, presence: true

has_many :sns_credentials
has_one  :card
has_many :likes
has_many :products
has_many :comments
has_one  :address, dependent: :destroy
accepts_nested_attributes_for :address

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = sns.user || User.where(email: auth.info.email,).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
