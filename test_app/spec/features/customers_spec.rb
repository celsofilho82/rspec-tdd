require 'rails_helper'

# Ativando o suporte a javascript com o parâmetro js: true
RSpec.feature "Customers", type: :feature, js: true do
  
  it "Navegando na pagina /customers" do
    visit(customers_path)
    # print page.html -> Imprime a página html no conseole
    # save_and_open_page -> Salva a página visitada em um determinado diretório ../tmp/capybara/capybara-***.html
    # page.save_screenshot('screenshot.png') -> Salva um screenshot da página no diretório ../tmp/capybara/[nome do screenshot]
    expect(page).to have_current_path(customers_path) 
  end

  it "Criando um usuário" do
    # Criando um usuário para realizar o login
    member = create(:member)
   
    # Fazendo o login
    login_as(member, :scope => :member)
    
    # Visitando a página (new) para criar um novo usuário
    visit(new_customer_path)

    # Preenchendo o formulário com os dados do usuário
    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)

    # Clicando no botão para criar um novo cliente
    click_on('Create Customer')

    # Verificando se na página aparece a mensagem de sucesso!
    expect(page).to have_content('Customer was successfully created.')

  end
  


end
