require 'rails_helper'

RSpec.describe Order, type: :model do
  it "Association belongs_to" do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)  
  end

  # Usandos listas para criar mais de um item da fábrica
  it 'Has three orders' do
    # Usuando o create_list para gerar 3 pedidos na fábrica orders
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)  
  end

  # Usando a trait with_orders que utiliza uma associação has_many para gerar
  # 3 pedidos por usuário
  it "Association has_many" do
    customer = create(:customer, :with_orders)
    expect(customer.orders.count).to eq(3)  
  end
  
  
end
