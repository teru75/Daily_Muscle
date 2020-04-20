class MyMenusController < ApplicationController
  def new
    @customer =Customer.find(current_customer.id)
    @my_menu = MyMenu.new
    @my_menu_item = @my_menu.my_menu_items.build
  end
  
  def create
    @my_menu = MyMenu.new(my_menu_params)
    @my_menu.customer_id = current_customer.id

    if @my_menu.save
      flash[:success] = "マイメニューを登録しました！"
       redirect_to customer_my_menu_path(@my_menu.customer_id, @my_menu)
    else
      render :new
    end
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @whole_bodys = @customer.my_menus.where(part: :whole_body)
    @upper_bodys = @customer.my_menus.where(part: :upper_body)
    @arms = @customer.my_menus.where(part: :arm)
    @shoulders = @customer.my_menus.where(part: :sholders)
    @breasts = @customer.my_menus.where(part: :breast)
    @backs = @customer.my_menus.where(part: :back)
    @lower_bodys = @customer.my_menus.where(part: :lower_body)
    @trunks = @customer.my_menus.where(part: :trunk)
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @my_menu = @customer.my_menus.find(params[:id])
  end


  def update
    @my_menu = MyMenu.find(params[:id])
    if @my_menu.customer_id != current_customer.id
      flash[:danger] = "他アカウントの編集はできません。"
      redirect_to customer_my_menus_path
    end
    if @my_menu.update(my_menu_params)
       flash[:success] = "マイメニューが編集されました！"
      redirect_to customer_my_menu_path(@my_menu.customer_id, @my_menu)
    else
      @customer = Customer.find(params[:customer_id])
      @my_menu = @customer.my_menus.find(params[:id])
      render :show
    end
  end

  def destroy
    @my_menu = MyMenu.find(params[:id])
    if @my_menu.customer_id != current_customer.id
      flash[:danger] = "他アカウントの編集はできません。"
      redirect_to customer_my_menus_path
    end
    @my_menu.destroy
    flash[:notice] = "マイメニューを削除しました。"
    redirect_to customer_my_menus_path
  end

  private
  def my_menu_params
    params.require(:my_menu).permit(:part, :theme,
        my_menu_items_attributes:[:id, :name, :_destroy]
      )
  end
end
