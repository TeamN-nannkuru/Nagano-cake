class Public::CartItemsController < ApplicationController
  def index
    @cart_items=current_customer.cart_items
    @total_price=@cart_items.sum{|cart_item|cart_item.item.price*cart_item.item_count*1.1}
  end
  
  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customers_id=current_customer.id
      @cart_item.item_id=params[:item_id]
      if @cart_item.save
        redirect_to public_cart_items_path
      else
        render 'index'
      end
  end
  
  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end
  
  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end
  
  def destroy_all
    @cart_items=current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end
end

private

def cart_item_params
  params.require(:cart_item).permit(:item_id, :item_count, :customer_id)
end