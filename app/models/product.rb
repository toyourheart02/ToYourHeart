class Product < ApplicationRecord
  belongs_to :scene
  belongs_to :genre
  belongs_to :label
  belongs_to :artist
  attachment :music_image
  has_many :carts, dependent: :destroy
  has_many :users, through: :carts
end
