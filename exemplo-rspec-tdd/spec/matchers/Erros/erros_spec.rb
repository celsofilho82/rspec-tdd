require 'calculator'

describe Calculator do
  it "#div" do
    # Para conseguir testar uma exceção, devemos passar o código que devemos
    # testar em um bloco para o expect
    expect{subject.div(3, 0)}.to raise_exception  
  end

  it "#div" do
    # O mesmo exemplo agora sendo mais especifico quanto ao erro levantado
    expect{subject.div(3, 0)}.to raise_error(ZeroDivisionError)
  end
  


end
