class CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
     @customer = Customer.find(params[:id])
     @events = @customer.events
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer.id != current_customer.id
      flash[:alert] = "他アカウントの編集はできません。"
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

  def hide
    @customer = Customer.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @customer.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :is_data_available)
  end
end
