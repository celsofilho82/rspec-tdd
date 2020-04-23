require 'rails_helper'

RSpec.describe Customer, type: :model do

  fixtures :all

  it "Create a Customer without fixtures" do
    subject.name = "Celso Ribeiro"
    subject.email = "celso@gmai.com"
    subject.save
    expect(subject.name).to eq("Celso Ribeiro")  
  end

  it "Create a Customer with fixtures" do
    customer = customers(:jackson)
    expect(customer.name).to eq("Jackson Pires")  
  end
  
end
