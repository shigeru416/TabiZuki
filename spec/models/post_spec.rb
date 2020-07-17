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

	describe 'アソシエーションのテスト' do
	    context 'Userモデルとの関係' do
	      it 'N:1となっている' do
	        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
	      end
		end

		context 'Categoryモデルとの関係' do
	      it 'N:1となっている' do
	        expect(Post.reflect_on_association(:category).macro).to eq :belongs_to
	      end
		end

		context 'WannagoListモデルとの関係' do
	      it '1:Nとなっている' do
	        expect(Post.reflect_on_association(:wannago_lists).macro).to eq :has_many
	      end
		end

		context 'Favoriteモデルとの関係' do
	      it '1:Nとなっている' do
	        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
	      end
		end

		context 'PostImageモデルとの関係' do
	      it '1:Nとなっている' do
	        expect(Post.reflect_on_association(:post_images).macro).to eq :has_many
	      end
		end

		context 'BrowsingHistoryモデルとの関係' do
	      it '1:Nとなっている' do
	        expect(Post.reflect_on_association(:browsing_histories).macro).to eq :has_many
	      end
		end

		context 'PostCommentモデルとの関係' do
	      it '1:Nとなっている' do
	        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
	      end
		end
	end
end
