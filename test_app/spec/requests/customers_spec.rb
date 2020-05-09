require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "API Test" do
    context "index" do
      it "GET /customers - JSON 200 OK" do
        get "/customers.json"
        expect(response).to have_http_status(200)
        expect(response.body).to include_json([
          id: 1,
          name: (be_kind_of String), # Nome e email do tipo string
          email: (be_kind_of String)
        ])
      end
    end
    
    context "show" do
      it "GET /customers/1 - JSON 200 OK" do
        get "/customers/1.json"
        expect(response).to have_http_status(200)
        expect(response.body).to include_json(
          id: 1,
          name: (be_kind_of String), # Nome e email do tipo string
          email: (be_kind_of String)
        )
      end
    end
    
  end
end
