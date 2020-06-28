require 'rails_helper'

RSpec.describe "Searches", type: :request do

  describe "GET /post" do
    it "returns http success" do
      get "/searches/post"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /tag" do
    it "returns http success" do
      get "/searches/tag"
      expect(response).to have_http_status(:success)
    end
  end

end
