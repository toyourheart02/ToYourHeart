class Artist < ApplicationRecord
	validates :artist_name, presence: true, uniqueness: true
end
