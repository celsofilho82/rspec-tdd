require 'rails_helper'

RSpec.describe Order, type: :model do
  it "Has order" do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)  
  end

  # Usandos listas para criar mais de um item da fábrica
  it 'Has three orders' do
    # Usuando o create_list para gerar 3 pedidos na fábrica orders
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)  
  end
  
end
