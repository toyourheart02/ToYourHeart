class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   attachment :profile_image

  has_many :carts
  has_many :products, through: :carts
  has_many :reviews, dependent: :destroy
  has_many :products, through: :reviews

end
