require 'rails_helper'

# O que testar em um model:
# Quando instanciamos com atributos válidos, o model deve ser válido.
# Validações devem ser testadas. 
# Métodos de classe e instância dever executar corretamente

RSpec.describe Product, type: :model do
  it "Eh valido com descrição, preço e categoria" do
    product = create(:product)
    expect(product).to be_valid  
  end

  it "Eh invalido sem a descrição" do
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank") 
  end

  it "Eh invalido sem o preço" do
    product = build(:product, price: nil)
    product.valid?
    expect(product.errors[:price]).to include("can't be blank") 
  end

  it "Eh invalido sem a categoria" do
    product = build(:product, category: nil)
    product.valid?
    expect(product.errors[:category]).to include("can't be blank") 
  end

  it 'Retorna um produto com a descição completa #full_description' do
     product = create(:product)
     expect(product.full_description).to eq("#{product.description} - #{product.price}")  
  end
  
  
end
