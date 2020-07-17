require 'rails_helper'

RSpec.describe PostImage, type: :model do
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
				@post.user_id = @user.id
				@post.title = "example"
				@post.place = "example"
				@post.category_id = 1
				@post.content = "example"
				@post.post_images_images = []
				@post.save

				@post_image = PostImage.new
				@post_image.post_id = @post_id
				@post_image.image_id = "example"
				@post_image.save
			end
			it "post_images_imagesが空欄のためPostが保存されない（Postを入力してくださいのエラーが出る）" do
		        expect(@post_image).to be_invalid
		    end
		end
	end
end
