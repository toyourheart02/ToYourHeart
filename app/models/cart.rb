class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, numericality: {less_than_or_equal_to: 9}
end
