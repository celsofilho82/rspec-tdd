require 'rails_helper'

RSpec.feature "Welcome", type: :feature do
  scenario "Mostra mensagem de Bem-Vindo" do
    visit(root_path)
    expect(page).to have_content('Bem-Vindo')  
  end

  scenario "Verificar o link de cadastro de clientes" do
    visit(root_path)
    expect(find('ul li')).to have_link('Cadastro de Clientes')    
  end

end
