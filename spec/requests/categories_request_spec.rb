require 'rails_helper'

RSpec.describe "Categories", type: :request do

  describe "カテゴリーページ" do
    context "カテゴリーページが表示される" do
        before do
          get admins_categories_path
        end
        it "リクエストは200 OKとなること" do
          expect(response.status).to eq 200
        end
    end
  end

end
