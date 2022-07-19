class Public::CustomersController < ApplicationController
  def show
    @public = Public.find([:id])
  end

  def edit
  end

  def update
  end
end
