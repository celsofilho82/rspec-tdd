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

end
