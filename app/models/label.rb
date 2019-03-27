class Label < ApplicationRecord
	validates :label_name, presence: true, uniqueness: true
end
