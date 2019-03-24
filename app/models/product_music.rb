class ProductMusic < ApplicationRecord
  belongs_to :product
  belongs_to :music
end
