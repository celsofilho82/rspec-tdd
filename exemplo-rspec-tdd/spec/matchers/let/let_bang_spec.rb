$count = 0

describe "let!" do
  ordem_de_invocação = []

  # No caso do let!(com o bang) ele é executado antes de ser invocado no teste
  # diferente do let sem o bang
  
  let!(:contador) do
    ordem_de_invocação << :let!
    $count += 1
  end

  it "chama o método helper antes do teste" do
    ordem_de_invocação << :exemplo
    expect(ordem_de_invocação).to eq([:let!, :exemplo])
    expect(contador).to eq(1)  
  end
   
end
