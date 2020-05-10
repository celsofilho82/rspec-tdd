class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :show, :destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Cliente cadastrado com sucesso!'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    if @customer.destroy
      redirect_to customers_path, notice: 'Cliente excluido com sucesso!'
    else 
      render :index
    end
  end
  

  def update
      if @customer.update(customer_params)
        flash[:notice] = "Cliente atualizado com sucesso!"
        redirect_to customer_path(@customer)
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
    
  private

  def customer_params
    params.require(:customer).permit(:id, :name, :email, :smoker, :phone, :avatar)
  end
  
  def set_customer
    @customer = Customer.find(params[:id])
  end
  

end