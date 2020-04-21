require 'pessoa'

shared_examples 'status' do |sentimento|
  it "#{sentimento}" do
    pessoa.send("#{sentimento}!")
    expect(pessoa.status).to eq("Sentindo-se #{sentimento.capitalize}!")
  end
  
end

describe "Pessoa" do
  subject(:pessoa) { Pessoa.new }

  # Passando os parâmetros para o share examples
  it_behaves_like 'status', :feliz
  it_behaves_like 'status', :triste
  it_behaves_like 'status', :contente

  # O teste abaixo foi substituido pelo shared_examples
  # it "Feliz" do
  #   pessoa.feliz!
  #   expect(pessoa.status).to eq("Sentindo-se Feliz!")
  # end

  # it "Triste" do
  #   pessoa.triste!
  #   expect(pessoa.status).to eq("Sentindo-se Triste!")
  # end

  # it "Contente" do
  #   pessoa.contente!
  #   expect(pessoa.status).to eq("Sentindo-se Contente!")
  # end
  
end
