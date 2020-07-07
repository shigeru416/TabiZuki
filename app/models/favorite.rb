class Favorite < ApplicationRecord
# --------------------------------------
# Relations
# --------------------------------------
	belongs_to :user
	belongs_to :post

# --------------------------------------
# Validations
# --------------------------------------
	validates :post_id, uniqueness: {scope: :user_id}

end
