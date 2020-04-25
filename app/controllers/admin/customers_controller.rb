class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page]).reverse_order
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(admin_customer_params)
      flash[:success] = "会員情報を編集しました。"
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  private
  def admin_customer_params
    params.require(:customer).permit(:is_deleted, :is_data_available)
  end
end
