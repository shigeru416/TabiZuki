require 'rails_helper'

RSpec.describe User, type: :model do
  
	context "データが正しく保存される" do
	  	before do
			@user = User.new
			@user.email = "example@gmail.com"
			@user.password = "example"
			@user.name = "example"
			@user.introduction = "example"
			@user.save
		end
		it "全て入力してあるので保存される" do
	        expect(@user).to be_valid
	    end
	end
end
