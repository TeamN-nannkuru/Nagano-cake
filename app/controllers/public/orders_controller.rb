class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def infomation
    #情報確認画面
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.billing_amount = total_price + shipping
    if params[:select_address] == 0
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:select_address] == 1
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:select_address] == 2
      @order.postal_code = ordered.postal_code
      @order.address = ordered.address
      @order.name = ordered.name
    else
      render new
    end
  end
  
  def create
    #確定処理
    @order =current_customer.orders.new(order_params)
    if @order.save
      order_item.save
      cart_item.destroy_all
      redirect_to complete_path
    else
      render :new
    end
  end

  def complete
  end

  def index
    @order = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :ordered_postal_code, :ordered_address, :receriver_name)
  end
end