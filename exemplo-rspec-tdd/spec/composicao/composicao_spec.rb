describe "Ruby on Rails" do
  # Fazendo composição de expectativas usando o "and"
  it { is_expected.to start_with("Ruby").and end_with("Rails") } 

  # Fazendo composição de expectativas usando o "or"
  it { expect(fruta).to eq('banana').or eq('laranja').or eq('uva')  } 
  
  def fruta
    %w(banana laranja uva).sample
  end
  
end
