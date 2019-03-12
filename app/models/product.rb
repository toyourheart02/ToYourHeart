class Product < ApplicationRecord
  belongs_to :scene
  belongs_to :genre
  belongs_to :label
end
