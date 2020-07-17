require 'rails_helper'

RSpec.describe Room, type: :model do
	describe 'データのテスト' do
		context 'データが保存される' do
			before do
				@room = Room.new
				@room.id = 1
				@room.save
			end
			it '全て入力してあるので保存される' do
				expect(@room).to be_valid
			end
		end
	end

	describe 'アソシエーションのテスト' do
	    context 'UserRoomモデルとの関係' do
	      it '1:Nとなっている' do
	        expect(Room.reflect_on_association(:user_rooms).macro).to eq :has_many
	      end
		end

		context 'Chatモデルとの関係' do
	      it '1:Nとなっている' do
	        expect(Room.reflect_on_association(:chats).macro).to eq :has_many
	      end
		end
	end
end
