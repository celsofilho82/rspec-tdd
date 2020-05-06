require 'rails_helper'

# O que testar em um model:
# Quando instanciamos com atributos válidos, o model deve ser válido.
# Validações devem ser testadas. 
# Métodos de classe e instância dever executar corretamente

RSpec.describe Product, type: :model do

  context "Validações de model" do
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

  end
  
  context "Validações de model usando shoulda-matchers" do
     # A mesma validação acima usando a gem shoulda-matchers
     it { is_expected.to validate_presence_of(:description) }
     it { is_expected.to validate_presence_of(:price) }
     it { is_expected.to validate_presence_of(:category) }   
  end
  
  context "Validando associações belongs_to usando shoulda-matchers" do
     # Testando associação belongs_to para determinar se o produto pertence a uma categoria
    it { is_expected.to belong_to(:category) }
  end
  
  context "Validando métodos de instância" do      
    it '#full_description' do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")  
    end
  end

end
