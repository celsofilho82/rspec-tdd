describe "all" do
  # É esperado que todos os elementos deste array sejam ímpares
  it { expect([1,7,9]).to all (be_odd)  }

  # É esperado que todos os elementos sejam string e começem com a letra r 
  it { expect(['ruby', 'rails']).to all (be_a(String).and include('r') ) } 
end
