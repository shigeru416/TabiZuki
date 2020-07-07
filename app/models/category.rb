class Category < ApplicationRecord
# --------------------------------------
# Relations
# --------------------------------------
	has_many :posts, dependent: :destroy

# --------------------------------------
# Validations
# --------------------------------------
	validates :name, presence: true

end
