require 'calculator'
# Definindo o nome da classe que será testada descrevendo o seu teste.
describe Calculator do
  # Definindo os cados de teste
  # Usando o context para agrupar os tipos de teste que vamos utilizar
  # Para melhor clareza, devemos usar "#" para metódos de instância e "." metódos de classe
  context 'use #sum method' do
    it "with positive numbers" do
      # classe já é referenciada no descibe, usamos o subject para que não seja necessário instancia-la 
      # calc = Calculator.new
      result = subject.sum(5, 7)
      # Definido o critério para aceitação do teste
      expect(result).to eq(12) 
    end
    
    it "with negative numbers" do
      result = subject.sum(-5, 7)
      # Definido o critério para aceitação do teste
      expect(result).to eq(2) 
    end  
  end
end
