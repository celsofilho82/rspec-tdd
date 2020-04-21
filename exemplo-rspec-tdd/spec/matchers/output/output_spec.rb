describe "Matcher output" do
  # Esperamos que o método "puts" tenha mostrado uma mesagem na saida padrão
  it { expect{ puts "Celso Ribeiro" }.to output.to_stdout  } 

  # Podemos informar também qual é a mensagem da saida
  it { expect{ print "Celso Ribeiro" }.to output("Celso Ribeiro").to_stdout  }

  # Podemos testar também a saida de erro padrão
  it { expect{ warn "Celso Ribeiro" }.to output("Celso Ribeiro\n").to_stderr  }
end
