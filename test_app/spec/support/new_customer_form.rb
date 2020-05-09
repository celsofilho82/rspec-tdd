class NewCustomerForm

  # Includes
  include Capybara::DSL  # Capybara
  include FactoryBot::Syntax::Methods  # FactoryBot
  include Warden::Test::Helpers  # Devise
  include Rails.application.routes.url_helpers  # Routes

  # Realizando o login
  def login
    member = create(:member)
    login_as(member, :scope => :member)
    self
  end

  # Visitando a página
  def visit_page
    visit(new_customer_path)
    self
  end

  # Preenchendo o formulário
  def fill_in_with(params = {})
    fill_in('Name', with: params.fetch(:name, Faker::Name.name))
    fill_in('Email', with: params.fetch(:email, Faker::Internet.email))
    fill_in('Address', with: params.fetch(:address, Faker::Address.street_address))
    self
  end

  # Clicando no botão para submit
  def submit
    click_button('Create Customer')
  end
  
end