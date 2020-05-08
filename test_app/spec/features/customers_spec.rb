require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  
  it "Navegando na pagina /customers" do
    visit(customers_path)
    # print page.html -> Imprime a página html no conseole
    # save_and_open_page -> Salva a página visitada em um determinado diretório ../tmp/capybara/capybara-***.html
    page.save_screenshot('screenshot.png')
    expect(page).to have_current_path(customers_path) 
  end


end
