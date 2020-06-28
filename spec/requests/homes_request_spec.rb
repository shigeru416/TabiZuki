require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "GET /about" do
    it "returns http success" do
      get "/homes/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /tabizukimembership" do
    it "returns http success" do
      get "/homes/tabizukimembership"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /home" do
    it "returns http success" do
      get "/homes/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /timeline" do
    it "returns http success" do
      get "/homes/timeline"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /favorites" do
    it "returns http success" do
      get "/homes/favorites"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /ranking" do
    it "returns http success" do
      get "/homes/ranking"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/homes/new"
      expect(response).to have_http_status(:success)
    end
  end

end
