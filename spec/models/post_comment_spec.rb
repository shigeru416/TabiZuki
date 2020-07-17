require 'rails_helper'

RSpec.describe PostComment, type: :model do
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

				@post_comment = PostComment.new
				@post_comment.user_id = @user_id
				@post_comment.post_id = @post_id
				@post_comment.comment = "example"
				@post_comment.save
			end
			it "post_images_imagesが空欄のためPostが保存されない（Postを入力してくださいのエラーが出る）" do
		        expect(@post_comment).to be_invalid
		    end
		end
	end

	describe 'アソシエーションのテスト' do
	    context 'Userモデルとの関係' do
	      it 'N:1となっている' do
	        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
	      end
		end

		context 'Postモデルとの関係' do
	      it 'N:1となっている' do
	        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
	      end
		end
	end
end
