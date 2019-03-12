class Music < ApplicationRecord
  belongs_to :artist
  validates :music_name, presence: true
  validates :artist_id, presence: true
end
