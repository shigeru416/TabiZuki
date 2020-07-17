require 'rails_helper'

RSpec.describe Post, type: :model do
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

				@category = Category.new
				@category.id = 1
				@category.name = "example"
				@category.save

				@post = Post.new
				@post.user_id = @user.id
				@post.title = "example"
				@post.place = "example"
				@post.category_id = 1
				@post.content = "example"
				@post.post_images_images = []
				@post.save
			end
			it "post_images_imagesが空欄のため保存されない（その他のエラーは見られない）" do
		        expect(@post).to be_invalid
		    end
		end
	end
end
