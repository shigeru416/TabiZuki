require 'rails_helper'

RSpec.describe "Admins::Homes", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/admins/homes/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /today" do
    it "returns http success" do
      get "/admins/homes/today"
      expect(response).to have_http_status(:success)
    end
  end
end
