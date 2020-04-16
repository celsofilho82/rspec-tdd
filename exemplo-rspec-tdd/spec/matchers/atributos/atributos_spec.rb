require '../../../lib/pessoa'

describe "Atributos" do
  
  # Verificando se a classe pessoa possui os atributos nome e idade
  it "have_attributes" do
    pessoa = Pessoa.new
    pessoa.nome = "Celso"
    pessoa.idade = 37
    expect(pessoa).to have_attributes(nome: "Celso", idade: 37)  

  end
  
end
