describe "Matchers de Comparaçao" do
  
  # o matcher "equal" valida se os objetos são iguais
      #  Compared using equal?, which compares object identity,
      #  but expected and actual are not the same object. Use
      #  `expect(actual).to eq(expected)` if you don't care about
      #  object identity in this example.

  it "#equal | #be" do
    x = "ruby"
    y = "ruby"
    expect(x).to equal(y) 
  end
  
  # O mathcer "eql" testá o valor e não o objeto
  it "#eql | #eq" do
    x = "ruby"
    y = "ruby"
    expect(x).to eql(y) 
  end
  
end
