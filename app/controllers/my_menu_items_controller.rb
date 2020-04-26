class MyMenuItemsController < ApplicationController
  before_action :authenticate_customer!

  def destroy
    @customer = Customer.find(params[:customer_id])
    @my_menu_item = @customer.my_menu_items.find(params[:id])
    if @my_menu_item.customer_id != current_customer.id
      flash[:danger] = "他アカウントの編集はできません。"
      redirect_to customer_my_menus_path
    end
    @my_menu_item.destroy
    flash[:notice] = "マイメニューを削除しました。"
    redirect_to customer_my_menus_path(current_customer)
  end

end
