class Room < ApplicationRecord

	has_many :user_rooms, dependent: :destroy

end
