require 'rails_helper'

# Definindo testes para um controllers
# Um controller:
# - Recebe uma requisição (com ou sem autenticação/autorização)
# - Manipula Models
# - Cria uma resposta:
# 	- Renderiza um template
# 	- Responde com um formato solicitado (JSON)
# 	- Redireciona para outra rota

RSpec.describe CustomersController, type: :controller do

  # Fazendo uma requisição GET para a action index do customers_controller
  
  context "index" do
    it "Responde http status 200" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  context "show" do
    it "Responde http status 302 quando não autenticado " do
      get :show, params: { id: Customer.first.id }
      expect(response).to have_http_status "302"
    end

    it "Responde http status 200 quando autenticado" do
      member = create(:member)
      sign_in member
      get :show, params: { id: Customer.first.id }
      expect(response).to have_http_status "200"
    end
    
    it "Deve renderizar o template show" do
      member = create(:member)
      sign_in member
      get :show, params: { id: Customer.first.id }
      expect(response).to render_template(:show)
    end

  end
  
  context "create" do
    it "Com usuário logado, deve cadastrar cliente" do
      member = create(:member)
      sign_in member
      customer_params = attributes_for(:customer)
      post :create, params: { customer: customer_params }
      expect(flash[:notice]).to match(/successfully created/)  
    end 

    it "Com usuário logado, não deve cadastrar cliente faltando dados" do
      member = create(:member)
      sign_in member
      customer_params = attributes_for(:customer, address: nil)
      expect{post :create, params: { customer: customer_params }}.
      not_to change(Customer, :count) 
    end

    it "Deve retornar um cliente em formato json" do
      member = create(:member)
      sign_in member
      customer_params = attributes_for(:customer)
      post :create, format: :json, params: { customer: customer_params }
      expect(response.content_type).to eq('application/json')
    end

  end
  
  context "shoulda-matchers" do
    it { should route(:get, '/customers').to(action: :index) }
  end  
  



  

end
