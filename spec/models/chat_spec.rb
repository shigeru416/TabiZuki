require 'rails_helper'

RSpec.describe Chat, type: :model do
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

				@chat = Chat.new
				@chat.user_id = @user.id
				@chat.room_id = @room.id
				@chat.message = "example"
				@chat.save
			end
			it "全て入力してあるので保存される" do
		        expect(@chat).to be_valid
		    end
		end

		context "データが正しく保存されない" do
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

				@chat = Chat.new
				@chat.user_id = @user.id
				@chat.room_id = @room.id
				@chat.message = ""
				@chat.save
			end
			it "messageが空欄なので保存されない" do
		        expect(@chat).to be_invalid
		    end
		end
	end


end
