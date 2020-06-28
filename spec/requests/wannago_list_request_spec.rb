require 'rails_helper'

RSpec.describe "WannagoLists", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/wannago_list/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/wannago_list/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
