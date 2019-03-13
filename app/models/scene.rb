class Scene < ApplicationRecord
	validates :scene_name, presence: true, uniqueness: true
end
