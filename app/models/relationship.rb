class Relationship < ApplicationRecord
  # --------------------------------------
  # Relations
  # --------------------------------------
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
