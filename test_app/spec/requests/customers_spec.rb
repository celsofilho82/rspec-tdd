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

    context "create" do
      it "POST /customers" do
        member = create(:member)
        login_as(member, scope: :member)

        headers = { "ACCEPT" => "application/json"}

        customers_params = attributes_for(:customer)

        post "/customers.json", params: { customer: customers_params }, headers: headers

        expect(response).to have_http_status(201)
        
        expect(response.body).to include_json(
          id: /\d/,
          name: customers_params[:name],
          email: customers_params[:email]
        )  
      end
    end
  
  end
end
