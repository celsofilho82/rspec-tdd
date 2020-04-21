require 'contador'

describe "Mather change" do
  # Ao executar (Contador.incrementa) o teste espera uma mudança em (Contador.qtd)
  it { expect{ Contador.incrementa }.to change { Contador.qtd } } 

  # Neste exemplo, podemos informar o valor esperado da mudança
  it { expect{ Contador.incrementa }.to change { Contador.qtd }.by(1) }

  # Neste exemplo eu digo como a mudança vai acontecer, neste caso de 2 para 3
  it { expect{ Contador.incrementa }.to change { Contador.qtd }.from(2).to(3) }
end
