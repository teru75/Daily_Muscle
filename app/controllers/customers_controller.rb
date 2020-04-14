class CustomersController < ApplicationController
  def show
     @events = Event.all
     @customer = Customer.find(params[:id])
  end

  def index
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
