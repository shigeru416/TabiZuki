require 'rails_helper'

RSpec.describe "PostComments", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/post_comments/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/post_comments/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
