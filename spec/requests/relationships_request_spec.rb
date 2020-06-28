require 'rails_helper'

RSpec.describe "Relationships", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/relationships/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/relationships/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /follower" do
    it "returns http success" do
      get "/relationships/follower"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /followed" do
    it "returns http success" do
      get "/relationships/followed"
      expect(response).to have_http_status(:success)
    end
  end

end
