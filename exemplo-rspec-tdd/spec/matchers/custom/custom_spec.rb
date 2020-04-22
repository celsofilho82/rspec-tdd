RSpec::Matchers.define :be_a_multiple_of do |expected|
  # expected neste teste será o "3"
  # actual neste caso é o subject que é o "18"
  match do |actual|
    actual % expected == 0
  end

  # Customizando as mensagens de erro
  failure_message do |actual|
    "expected that #{actual} would be a multiple of #{expected}"
  end

  # Customizando a mensagem de sucesso
  description do
    "be a multiple of #{expected}!!!"
  end

end

describe 18, "Custom Matcher" do
  
  it { is_expected.to be_a_multiple_of(3) }

end
