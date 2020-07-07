class Room < ApplicationRecord
# --------------------------------------
# Relations
# --------------------------------------
	has_many :user_rooms, dependent: :destroy
	has_many :chats

end
