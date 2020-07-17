require 'rails_helper'

RSpec.describe UserRoom, type: :model do
	describe 'データのテスト' do
		context "データが正しく保存される" do
			before do
				@user = User.new
				@user.id = 1
				@user.email = "example@gmail.com"
				@user.password = "example"
				@user.name = "example"
				@user.introduction = "example"
				@user.save

				@room = Room.new
				@room.id = 1
				@room.save

				@user_room = UserRoom.new
				@user_room.user_id = @user.id
				@user_room.room_id = @room.id
				@user_room.save
			end
			it "全て入力してあるので保存される" do
		        expect(@user_room).to be_valid
		    end
		end
	end
end
