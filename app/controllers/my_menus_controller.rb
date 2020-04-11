class MyMenusController < ApplicationController
  def new
    @my_menu = MyMenu.new
    @my_menu_item = @my_menu.my_menu_items.build
  end
  
  def create
    @my_menu = MyMenu.new(my_menu_params)
    @my_menu.customer_id = current_customer.id

    if @my_menu.save
      flash[:success] = "マイメニューを登録しました！"
       redirect_to customer_my_menus_path(@my_menu)
    else
      render :new
    end
  end

  def index
    @my_menus = MyMenu.all
    # レイアウト作成時に部位別に分ける記述
    # @Upper_bodys = MyMenu.where(part: upper_body)
    
  end

  def show
    @my_menu = MyMenu.find(params[:id])
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
