describe "Satisfy" do
  
  # Usando para testes onde o resultado deve satisfazer uma determinada expressão
  it { expect(10).to satisfy { |x| x % 2 == 0} }

  # Uma otra forma deixando o resultado melhor apresentável
  it { expect(9).to satisfy('be a multiple of 3') do  |x| 
      x % 3 == 0 
    end 
  }
end
