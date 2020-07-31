require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "アバウトページ" do
    context "アバウトページが表示される" do
      before do
        get about_path
      end

      it "リクエストは200 OKとなること" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "メンバーシップページ" do
    context "メンバーシップページが表示される" do
      before do
        get tabizukimembership_path
      end

      it "リクエストは200 OKとなること" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "トップページ" do
    context "トップページが表示される" do
      before do
        get root_path
      end

      it "リクエストは200 OKとなること" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "タイムラインページ" do
    context "タイムラインページが表示される" do
      before do
        get timeline_path
      end

      it "リクエストは200 OKとなること" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "お気に入りページ" do
    context "お気に入りページが表示される" do
      before do
        get favorites_path
      end

      it "リクエストは200 OKとなること" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "ランキングページ" do
    context "ランキングページが表示される" do
      before do
        get ranking_path
      end

      it "リクエストは200 OKとなること" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "新しい投稿ページ" do
    context "新しい投稿ページが表示される" do
      before do
        get new_path
      end

      it "リクエストは200 OKとなること" do
        expect(response.status).to eq 200
      end
    end
  end
end
