require 'student'
require 'course'

describe "Mocks" do
  it "#bar" do
    # Quando trabalhamos com mocks as fazes de teste ficam invertidas:
    # A ordem correta é: setup, exercise e verify
    # Os Mocks são usados para testar comportamentos: Mock Expectation
    # Os Stubs são usados para substituir estados
    
    # Setup
    student = Student.new

    # Verify
    expect(student).to receive(:bar)

    # Exercise
    student.bar
  end
  
end
