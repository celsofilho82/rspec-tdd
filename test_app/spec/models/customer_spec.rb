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

  it "Create a Customer with FactoryBot(FactoryGirl)" do
    customer = create(:customer)
    expect(customer.fullname).to start_with("Sr. ")  
  end
  
  it { expect { create(:customer) }.to change{ Customer.all.size }.by(1) } 

  it "Create a Customer with FactoryBot heritage" do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)  
  end

  # attributes_for extrair os atributos de uma determinada factory
  it "Using attributes_for" do
    # Extraindo os atributos da fabrica :customer
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.fullname).to start_with("Sr. ")  
  end

end
