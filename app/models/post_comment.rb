class PostComment < ApplicationRecord
# --------------------------------------
# Relations
# --------------------------------------
	belongs_to :user
	belongs_to :post

end
