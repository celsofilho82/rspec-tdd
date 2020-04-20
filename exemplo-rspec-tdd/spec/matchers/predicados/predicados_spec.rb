# Para que um método predicado do Ruby vire um matchers predicados do RSPEC,
# podemos retirar a interrogação do método e substituir pela palavra be_
# Ex: "1.odd?" por expect(1).to be_odd

describe "Predicados" do
  it "odd" do
    expect(1).to be_odd  
  end

  it "even" do
    expect(2).to be_even
  end
  
end
