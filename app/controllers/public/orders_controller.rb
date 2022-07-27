class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def create
    cart_items = current_customer.cart_items.all
    @order =current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_item = OrderItem.new
        order_item.item_id = cart_item.item_id
        order_item.order_id = @order_id
        order_item.item_count = cart_item.item_count
        order_item.ordered_price = cart_item.billing_amount
        order_item.save
      end
    end
  end
  
  def infomation
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.name
    @order.billing_amount = total_price + shipping
    
  end
  
  def decision
  end

  def complete
  end

  def index
    @order = Order.find(params[:customer_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.name
    @order.billing_amount = total_price + shipping
    @order.order_status = order_item.making_status
    @order.item = items.name
    @order.day = created_at
  end

  def show
    @order = Order.find(params[:customer_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.name
    @order.billing_amount = total_price + shipping
    @order.order_status = order_item.making_status
    @order.item = items.name
    @order.day = created_at
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end