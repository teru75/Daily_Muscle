class MyMenusController < ApplicationController
  before_action :authenticate_customer!
  def new
    @customer = Customer.find(current_customer.id)
    @my_menu = MyMenu.new
    @my_menu_item = @my_menu.my_menu_items.build
  end

  def create
    @my_menu = MyMenu.new(my_menu_params)
    @my_menu.customer_id = current_customer.id

    if @my_menu.save
      flash[:success] = "マイメニューを登録しました！"
      redirect_to customer_my_menus_path(@my_menu.customer_id)
    else
      @customer = Customer.find(current_customer.id)
      render :new
    end
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @whole_bodys = @customer.my_menus.where(part: :whole_body)
    @upper_bodys = @customer.my_menus.where(part: :upper_body)
    @arms = @customer.my_menus.where(part: :arm)
    @shoulders = @customer.my_menus.where(part: :shoulder)
    @breasts = @customer.my_menus.where(part: :breast)
    @backs = @customer.my_menus.where(part: :back)
    @lower_bodys = @customer.my_menus.where(part: :lower_body)
    @trunks = @customer.my_menus.where(part: :trunk)
  end

  private

  def my_menu_params
    params.require(:my_menu).permit(:part,
                                    my_menu_items_attributes: [:id, :customer_id, :name, :_destroy])
  end
end
