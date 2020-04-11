class CustomersController < ApplicationController
  def show
     @events = Event.all
     @customer = Customer.find(params[:id])
  end

  def edit
    @customer =Customer.find(params[:id])
    if @customer.id != current_customer.id
      redirect_to customer_path(@customer)
    end

  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "ユーザー情報を編集しました。"
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def index
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :is_data_available)
  end
end
