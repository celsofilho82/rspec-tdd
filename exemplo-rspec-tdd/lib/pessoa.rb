class Pessoa  
  attr_accessor :nome, :idade
  attr_accessor :status

  def feliz!
    @status = "Sentindo-se Feliz!"
  end
  
  def triste!
    @status = "Sentindo-se Triste!"
  end

  def contente!
    @status = "Sentindo-se Contente!"
  end
end