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


end
