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

    context "update" do
      it "PATCH /customers/1" do
        member = create(:member)
        login_as(member, scope: :member)

        headers = { "ACCEPT" => "application/json"}

        customer = Customer.first
        customer.name += " - Atualizado"

        patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers

        expect(response).to have_http_status(200)
        
        expect(response.body).to include_json(
          id: /\d/,
          name: customer.name,
          email: customer.email
        )  
      end
    end

    context "delete" do
      it "DELETE /customers/1.json" do
        member = create(:member)
        login_as(member, scope: :member)

        headers = { "ACCEPT" => "application/json"}

        customer = Customer.first
        delete "/customers/#{customer.id}.json", headers: headers
        expect(response).to have_http_status(204)
      end
    end

    it "Using JSON.parse()" do
      get "/customers/1.json"
      response_body = JSON.parse(response.body)
      expect(response_body.fetch("id")).to eq(1)
      expect(response_body.fetch("name")).to be_kind_of(String)
      expect(response_body.fetch("email")).to be_kind_of(String) 
    end

    it "Using JSON Schema" do
      get "/customers/1.json"
      expect(response).to match_response_schema("customer")
    end
    
    
      
  end
end
