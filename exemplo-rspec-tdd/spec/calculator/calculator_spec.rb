require 'calculator'
# Definindo o nome da classe que será testada descrevendo o seu teste.
describe Calculator do
  # Definindo os cados de teste
  it "sum method for 2 numbers" do
    calc = Calculator.new
    result = calc.sum(5, 7)
    # Definido o critério para aceitação do teste
    expect(result).to eq(12) 
  end
  
  it "user sum method for 2 numbers with negative numbers" do
    calc = Calculator.new
    result = calc.sum(-5, 7)
    # Definido o critério para aceitação do teste
    expect(result).to eq(2) 
  end

end
