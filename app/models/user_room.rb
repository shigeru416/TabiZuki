class UserRoom < ApplicationRecord
  # --------------------------------------
  # Relations
  # --------------------------------------
  belongs_to :user
  belongs_to :room
end
