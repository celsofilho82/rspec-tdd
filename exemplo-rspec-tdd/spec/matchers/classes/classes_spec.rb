describe "Classes" do
  
  # Testa exatamente a classe
  it "be_instance_of" do
    expect(10).to be_instance_of(Integer)
  end
  
  # Estes comparadores tem o mesmo comportamento, podendo fazer testes
  # de classe por herança.
  it "be_kind_of | be_a | be_an " do
    expect(10).to be_kind_of(Integer)
  end

  # Verificando se a classe reponde a um determinado metódo
  it "respond_to" do
    expect("ruby").to respond_to(:size) 
  end
  
  
end
