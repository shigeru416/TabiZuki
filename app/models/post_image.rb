class PostImage < ApplicationRecord
  # --------------------------------------
  # Relations
  # --------------------------------------
  belongs_to :post

  attachment :image
end
