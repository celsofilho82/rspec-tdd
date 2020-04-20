describe Array.new([1,2,3,4,5]) do
  
  it "#include" do
    # Verifica se no array inclui o elemento informado
    expect(subject).to include(3)
  end

  it "#contain_exactly" do
    # Verifica se o array contém exatamente os elementos que você espera
    expect(subject).to contain_exactly(1,2,3,4,5)
  end
  
  it "#match_array" do
    # Verifica se o array testado é exatamento o array que você espera.
    expect(subject).to match_array([1,2,3,4,5])
  end
  
end
