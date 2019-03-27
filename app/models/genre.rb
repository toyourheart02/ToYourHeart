class Genre < ApplicationRecord
	validates :genre_name, presence: true, uniqueness: true
end
