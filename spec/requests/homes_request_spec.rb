require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "アバウトページ" do
    context "アバウトページが表示される" do
        before do
          get about_path
        end
        it "成功" do
          expect(response).to have_http_status(:success)
        end
    end
  end
  describe "GET /tabizukimembership" do
  end

  describe "GET /home" do
  end

  describe "GET /timeline" do
  end

  describe "GET /favorites" do
  end

  describe "GET /ranking" do
  end

  describe "GET /new" do
  end
end
