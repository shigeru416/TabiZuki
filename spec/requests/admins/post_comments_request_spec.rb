require 'rails_helper'

RSpec.describe "Admins::PostComments", type: :request do
  describe "GET /destroy" do
    it "returns http success" do
      get "/admins/post_comments/destroy"
      expect(response).to have_http_status(:success)
    end
  end
end
