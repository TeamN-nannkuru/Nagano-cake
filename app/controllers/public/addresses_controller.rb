class Public::AddressesController < ApplicationController

  
  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  def create
    @address = Address.new(address_params)
    #ここのコメントを外す！！
    #@address.customer_id = current_customer.id
  end

  def edit
    @address = Address.find(params[:id])
    if @address.customer_id == current_customer.id
      render "edit"
    else
      redirect_to address_path
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to address_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:ordered_postal_code, :ordered_address, :receriver_name)
  end
end
