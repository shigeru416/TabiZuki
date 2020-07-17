require 'rails_helper'

RSpec.describe BrowsingHistory, type: :model do
	describe 'データのテスト' do
		context "データが正しく保存されない" do
		  	before do
				@user = User.new
				@user.id = 1
				@user.email = "example@gmail.com"
				@user.password = "example"
				@user.name = "example"
				@user.introduction = "example"
				@user.save

				@post = Post.new
				@post.id = 1
				@post.user_id = @user.id
				@post.title = "example"
				@post.place = "example"
				@post.category_id = 1
				@post.content = "example"
				@post.post_images_images = []
				@post.save

				@browsing_history = BrowsingHistory.new
				@browsing_history.user_id = @user.id
				@browsing_history.post_id = @post.id
				@browsing_history.save
			end
			it "post_images_imagesが空欄のためPostが保存されない（Postを入力してくださいのエラーが出る）" do
		        expect(@browsing_history).to be_invalid
		    end
		end
	end
end
