class ProductMusic < ApplicationRecord
  belongs_to :product
  belongs_to :music
  validates :music_id, presence: :true
end
