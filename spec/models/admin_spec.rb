require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'データのテスト' do
    context "データが正しく保存される" do
      before do
        @admin = Admin.new
        @admin.id = 1
        @admin.email = "example@gmail.com"
        @admin.password = "example"
        @admin.save
      end

      it "全て入力してあるので保存される" do
        expect(@admin).to be_valid
      end
    end

    context "データが正しく保存されない" do
      before do
        @admin = Admin.new
        @admin.id = 1
        @admin.email = ""
        @admin.password = "example"
        @admin.save
      end

      it "emailが入力されていないので保存されない" do
        expect(@admin).to be_invalid
      end
    end

    context "データが正しく保存されない" do
      before do
        @admin = Admin.new
        @admin.id = 1
        @admin.email = "example@gmail.com"
        @admin.password = ""
        @admin.save
      end

      it "passwordが入力されていないので保存されない" do
        expect(@admin).to be_invalid
      end
    end
  end
end
