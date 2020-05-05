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

  # Gerando atributos transitórios onde caso seja informado no método
  # será executando um after: definido na factory
  it "Using transient attribute" do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end
  
  # Ao transformar a factory gender em "trait" podemos utilizar-la em composição
  # com outras factorys
  it 'Customer vip and male' do
    customer = create(:customer_vip, :male)
    expect(customer.gender).to eq('M')  
  end

  # Testando as traits default
  it 'Trait customer default male' do
    customer = create(:customer_default_male)
    expect(customer.days_to_pay).to eq(15)
    expect(customer.gender).to eq('M')   
  end

  it 'Trait customer default female' do
    customer = create(:customer_default_female)
    expect(customer.days_to_pay).to eq(15)
    expect(customer.gender).to eq('F') 
  end

  # Testando o time helper do rails para testes com datas
  it 'Usando time helper' do
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip, :male)
    end
    expect(@customer.created_at).to eq(Time.new(2004, 11, 24, 01, 04, 44))  
  end

end
