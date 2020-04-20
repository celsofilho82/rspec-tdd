describe (1..5), "Ranges" do
  it "#cover" do
    expect(subject).to cover(2)
    expect(subject).to cover(2, 5)
    expect(subject).not_to cover(0, 6)

  end
  # Refatorando o teste acima para oneline syntax
  # Podemos usar o is_expected ou passar o expect(subject) no bloco
  it { is_expected.to cover(2)  }
  it { is_expected.to cover(2, 5) }
  it { expect(subject).not_to cover(0, 6) } 
  
end