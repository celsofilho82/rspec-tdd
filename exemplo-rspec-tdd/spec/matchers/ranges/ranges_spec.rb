describe (1..5), "Ranges" do
  it "#cover" do
    # Verifica se um determinado elemento está dentro de uma range
    expect(subject).to cover(2, 5)
  end
  
end
