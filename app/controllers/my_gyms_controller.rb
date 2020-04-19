class MyGymsController < ApplicationController
def new
    @my_gym = MyGym.new
    @customer =Customer.find(params[:customer_id])
  end
  
  def create
    @my_gym = MyGym.new(my_gym_params)
    @my_gym.customer_id = current_customer.id

    if @my_gym.save
      flash[:success] = "マイジムを登録しました！"
       redirect_to customer_my_gym_path(@my_gym.customer_id, @my_gym)
    else
      render :new
    end
  end

  def index
    @customer = Customer.find(params[:customer_id])
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @my_gym = @customer.my_gyms.find(params[:id])
  end


  def update
    @my_gym = MyGym.find(params[:id])
    if @my_gym.customer_id != current_customer.id
      flash[:danger] = "他アカウントの編集はできません。"
      redirect_to customer_my_gyms_path(current_customer)
    end
    if @my_gym.update(my_gym_params)
      flash[:success] = "マイジムを編集しました！"
      redirect_to customer_my_gym_path(@my_gym.customer_id, @my_gym)
    else
      render :new
    end
  end

  def destroy
    @my_gym = MyGym.find(params[:id])
    if @my_gym.customer_id != current_customer.id
      flash[:danger] = "他アカウントの編集はできません。"
      redirect_to customer_my_gyms_path(current_customer)
    end
    @my_gym.destroy
    flash[:notice] = "マイメニューを削除しました。"
    redirect_to customer_my_gyms_path(current_customer)
  end

  private
  def my_gym_params
    params.require(:my_gym).permit(:name)
  end
end
