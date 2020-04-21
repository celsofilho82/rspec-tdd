describe "Agregação de falhas" do
  
  it "Neste teste as falhas estão agregadas" do
    aggregate_failures do
      expect(5).to be_between(2,7).inclusive
      expect(1).to be_between(2,7).inclusive
      expect(8).to be_between(2,7).inclusive
    end
    
  end
  

end
