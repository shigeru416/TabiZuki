require 'rails_helper'

RSpec.describe WannagoList, type: :model do
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

        @post = Post.new
        @post.user_id = @user.id
        @post.title = "example"
        @post.place = "example"
        @post.category_id = 1
        @post.content = "example"
        @post.post_images_images = []
        @post.save

        @wannago_list = WannagoList.new
        @wannago_list.user_id = @user.id
        @wannago_list.post_id = @post.id
        @wannago_list.save
      end

      it "post_images_imagesが空欄のためPostが保存されない（Postを入力してくださいのエラーが出る）" do
        expect(@wannago_list).to be_invalid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(WannagoList.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(WannagoList.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end
