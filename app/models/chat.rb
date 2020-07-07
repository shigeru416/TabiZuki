class Chat < ApplicationRecord
# --------------------------------------
# Relations
# --------------------------------------
	belongs_to :user
	belongs_to :room

# --------------------------------------
# Validations
# --------------------------------------
	validates :message, presence: true

end
