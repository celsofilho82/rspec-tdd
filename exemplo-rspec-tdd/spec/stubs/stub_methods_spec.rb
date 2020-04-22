require 'student'
require 'course'

describe 'Stub Methods' do
  it "Argumentos dinâmicos" do
    student = Student.new  
    allow(student).to receive(:foo) do |arg|
      if arg == :hello
        "Olá!"
      elsif arg == :hi
        "Hi!!!"
      end
    end
    expect(student.foo(:hello)).to eq('Olá!')
    expect(student.foo(:hi)).to  eq('Hi!!!')  
  end
  
  it "Permitindo qualquer instância de Classe" do
    student = Student.new
    other_student = Student.new

    allow_any_instance_of(Student).to receive(:bar).and_return(true)
    expect(student.bar).to be_truthy
    expect(other_student.bar).to be_truthy
  end

  it "Erros" do
    student = Student.new
    allow(student).to receive(:bar).and_raise(RuntimeError)
    expect{ student.bar }.to raise_error(RuntimeError)
  end
  
end