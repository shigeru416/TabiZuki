class VisionImage < ApplicationRecord

	has_many :vision_tags
	has_many :vision_landmarks

	attachment :image
end
