class Public::CustomersController < ApplicationController
  def show
    @customer=current_customer
  end

  def edit
    @customer=current_customer
  end
  
  def update
    @customer=current_customer
    @customer.update(customer_params)
    redirect_to public_customers_path
  end

  def quit
  end
  
  def remove
    current_customer.update(user_status: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :user_status, :email)
  end
end
