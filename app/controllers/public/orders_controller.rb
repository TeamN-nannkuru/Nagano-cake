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

  def infomation
    @cart_items = current_customer.cart_items
    @order = Order.new
    
    @order.billing_amount = ordered_price(@order)
  end

  def complete
  end

  def index
  end

  def show
  end
end
