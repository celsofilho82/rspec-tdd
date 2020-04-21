require 'pessoa'
$counter = 0

describe "Atributos" do

  # Podemos instanciar o objeto pessoa com o helper let ao invés de instancia-la na
  # execução do teste. A variável do let só é carregada no momento de execução do teste.
  let(:pessoa) {Pessoa.new}

  it "have_attributes" do
    # pessoa = Pessoa.new -> substituido pelo let
    pessoa.nome = "Celso"
    pessoa.idade = 37
    expect(pessoa).to have_attributes(nome: "Celso", idade: 37)  

  end
  
end

describe "let" do
  let(:count) { $counter += 1  } 

  it "memoriza valor" do
    expect(count).to eq(1) # 1a vez que é carregado atribui 1 a variável
    expect(count).to eq(1) # 2a vez que é carregado não atribui valor (cache) 
  end
  
  it "não é cacheado entre os testes" do
    expect(count).to eq(2) # 3a vez que é carregado, teste diferente, atribui 1 a variável  
  end
  
end
