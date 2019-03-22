class Music < ApplicationRecord
  belongs_to :artist
  validates :music_name, presence: true
  validates :artist_id, presence: true
  # music_nameとartist_idの組み合わせで一意でなくてはならない
  validates :music_name, :uniqueness => {:scope => :artist_id}
  has_many :prodcut_musics
end
