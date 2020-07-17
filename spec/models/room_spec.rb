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
end
