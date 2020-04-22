require 'student'
require 'course'

# Com o stub forçamos uma resposta especifica de uma método que foi criado mas
# ainda não foi implementado

describe "Stub" do
  it "#has_finished?" do
    student = Student.new
    course = Course.new
    allow(student).to receive(:has_finished?).with(an_instance_of(Course)).and_return(true)
    course_finished = student.has_finished?(course)

    expect(course_finished).to be_truthy
  end
  
end
