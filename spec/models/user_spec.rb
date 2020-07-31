require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'データのテスト' do
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

    context "データが正しく保存されない" do
      before do
        @user = User.new
        @user.email = "example@gmail.com"
        @user.password = "example"
        @user.name = ""
        @user.introduction = "example"
        @user.save
      end

      it "nameが入力されていないので保存されない" do
        expect(@user).to be_invalid
      end
    end

    context "データが正しく保存されない" do
      before do
        @user = User.new
        @user.email = "example@gmail.com"
        @user.password = "example"
        @user.name = "example"
        @user.introduction = "exampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexample"
        @user.save
      end

      it "introductionが入力されていないので保存されない" do
        expect(@user).to be_invalid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'WannagoListモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:wannago_lists).macro).to eq :has_many
      end
    end

    context 'Chatモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:chats).macro).to eq :has_many
      end
    end

    context 'BrowsingHistoryモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:browsing_histories).macro).to eq :has_many
      end
    end

    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
  end
end
