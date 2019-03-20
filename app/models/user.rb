class User < ApplicationRecord
  # is_deletedがtrueのユーザはログインできないようにする
  def active_for_authentication?
    super && !is_deleted?
  end

# ここのメッセージが反映されない
  def inactive_message
    !is_deleted? ? super : :deleted_user
    # !is_deleted? super : :deleted_user
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   attachment :profile_image


  # has_one :current_user_cart, -> {where(user_id: current_user.id)}, class_name: 'Cart'
  # has_one :current_cart, through: :current_user_cart, source: :product


  has_many :carts, dependent: :destroy
  has_many :products, through: :carts
  has_many :destinations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
