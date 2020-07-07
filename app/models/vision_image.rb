class VisionImage < ApplicationRecord
# --------------------------------------
# Relations
# --------------------------------------
	has_many :vision_tags
	has_many :vision_landmarks

# --------------------------------------
# Validations
# --------------------------------------
	validates :image, presence: true

	attachment :image
end
