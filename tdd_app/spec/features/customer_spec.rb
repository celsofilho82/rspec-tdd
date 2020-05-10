require 'rails_helper'
require 'faker'

RSpec.feature "Customer", type: :feature do
  
  scenario "Verifica link cadastro de cliente" do
    visit(root_path)
    expect(page).to have_link('Cadastro de Clientes')  
  end

  scenario "Verifica link de Novo Cliente" do
    visit(root_path)
    click_on('Cadastro de Clientes')
    expect(page).to have_content('Listando Clientes')
    expect(page).to have_link('Novo Cliente')  
  end

  scenario "Verifica formulário de novo cliente" do
    visit(customers_path)
    click_on('Novo Cliente')
    expect(page).to have_content('Novo Cliente')  
  end

  scenario "Cadastrar um cliente válido" do
    visit(new_customer_path)
    customer_name = Faker::Name.name
    fill_in("Name",	with: customer_name)
    fill_in("Email",	with: Faker::Internet.email)
    fill_in("Phone",	with: Faker::PhoneNumber.phone_number_with_country_code) 
    attach_file("Avatar", "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ['Y', 'N'].sample)
    click_on('Criar Cliente')
    
    expect(page).to have_content('Cliente cadastrado com sucesso!')
    expect(Customer.last.name).to eq(customer_name)    
  end

  scenario "Não cadastrar um cliente inválido" do
    visit(new_customer_path)
    click_on('Criar Cliente')
    expect(page).to have_content("can't be blank")  
  end

  scenario "Mostrar um cliente" do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number_with_country_code,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )
    visit(customer_path(customer.id))

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)  
  end

  scenario "Lista de clientes" do
    customer1 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number_with_country_code,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    customer2 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number_with_country_code,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit(customers_path)
    expect(page).to have_content(customer1.name)
    expect(page).to have_content(customer2.name)    
  end

end
