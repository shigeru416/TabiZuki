require 'rails_helper'

RSpec.describe Category, type: :model do
	describe 'データのテスト' do
		context "データが正しく保存される" do
		  	before do
				@category = Category.new
				@category.name = "example"
				@category.save
			end
			it "全て入力してあるので保存される" do
		        expect(@category).to be_valid
		    end
		end

		context "データが正しく保存されない" do
	    	before do
				@category = Category.new
				@category.name = ""
				@category.save
		    end
		    it "nameが入力されていないので保存されない" do
		      expect(@category).to be_invalid
		    end
		end
	end
end
