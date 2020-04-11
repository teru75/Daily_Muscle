class MyMenusController < ApplicationController
  def new
    @my_menu = MyMenu.new
    @my_menu_item = @my_menu.my_menu_items.build
  end
  
  def create
    @my_menu = MyMenu.new(my_menu_params)
    @my_menu.customer_id = current_customer.id

    if @my_menu.save
       redirect_to customer_my_menus_path(@my_menu)
    else
      render :new
    end
  end

  def index
    @my_menus = MyMenu.all
    # @Upper_bodys = MyMenu.where(part: upper_body)
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def my_menu_params
    params.require(:my_menu).permit(:part, :theme,
        my_menu_items_attributes:[:id, :name]
      )
  end
end
