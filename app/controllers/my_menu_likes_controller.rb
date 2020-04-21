class MyMenuLikesController < ApplicationController

  def create
    @my_menu = MyMenu.find(params[:my_menu_id])
    like = current_customer.my_menu_likes.new(my_menu_id: @my_menu.id)
    like.save
    redirect_to request.referer
  end

  def destroy
    @my_menu = MyMenu.find(params[:my_menu_id])
    like = current_customer.my_menu_likes.find_by(my_menu_id: @my_menu.id)
    like.destroy
    redirect_to request.referer
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @likes = MyMenuLike.where(customer_id: @customer.id)
  end

end
