require 'rails_helper'

RSpec.describe "Admins::Categories", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/categories/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/admins/categories/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/admins/categories/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
