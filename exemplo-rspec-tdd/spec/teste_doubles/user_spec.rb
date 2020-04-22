# Um dublê de teste age com um objeto Ruby que pode ou não aceitar
# métodos. Você precisa especificar no dublê quais métodos ele deve aceitar.
# mock object, stub and spy são os tipos de doubles de testes implementados
# pelo RSpec

describe "Test Double" do 
  it 'does something' do
    # Passando uma classe falsa para o doublê
    user = double('User')
    # Permitindo que o doublê aceite as mensagens e informando o retorno destas
    allow(user).to receive_messages(nome: 'Celso', password: 'secret')
    user.nome
    user.password
  end

end
