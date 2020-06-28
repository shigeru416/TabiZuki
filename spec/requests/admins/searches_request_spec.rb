require 'rails_helper'

RSpec.describe "Admins::Searches", type: :request do

  describe "GET /tag" do
    it "returns http success" do
      get "/admins/searches/tag"
      expect(response).to have_http_status(:success)
    end
  end

end
