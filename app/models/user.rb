class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   attachment :profile_image


  # has_one :current_user_cart, -> {where(user_id: current_user.id)}, class_name: 'Cart'
  # has_one :current_cart, through: :current_user_cart, source: :product


  has_many :carts, dependent: :destroy
  has_many :products, through: :carts
  has_many :reviews, dependent: :destroy
end
