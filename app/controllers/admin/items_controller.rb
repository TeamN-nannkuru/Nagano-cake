class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
    @items=Item.all.page(params[:page]).per(10)
  end

  def new
    @item=Item.new
  end
  
  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  private
  
  def item_params
    params.repuire(:item).permit(:name, :description, :genre_id, :price, :sale_status, :image)
  end
end