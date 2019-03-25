class Product < ApplicationRecord
  belongs_to :scene
  belongs_to :genre
  belongs_to :label
  belongs_to :artist
  attachment :music_image
  has_many :carts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :carts
  has_many :product_musics, inverse_of: :product
  accepts_nested_attributes_for :product_musics, reject_if: :all_blank, allow_destroy: true
  # def favorited_by?(user)
  #   favorites.where(user_id: user.id).exists?
  # end
end
