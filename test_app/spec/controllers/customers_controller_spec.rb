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
  it "controller deve responder sucesso" do
    get :index
    expect(response).to be_success
  end

  it "controller deve responder com http status 200" do
    get :index
    expect(response).to have_http_status "200"
  end
  
end
