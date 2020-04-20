
describe "be_within" do
  # Esse matchers é utilizado para realizar validações em números de ponto flutuante
  # de acordo com o delta (0.5)
  it { expect(12.5).to be_within(0.5).of(12.0)  } 

end
