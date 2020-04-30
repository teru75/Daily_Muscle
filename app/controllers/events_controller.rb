class EventsController < ApplicationController
  before_action :authenticate_customer!
  def new
    @customer = Customer.find(current_customer.id)
    @event = Event.new
    @menu = @event.menus.build
    @reps = @menu.reps.build
  end

  def create
    @event = Event.new(event_params)
    @event.customer_id = current_customer.id
    unless menus_and_reps_exists?(@event)
      flash[:alert] = "空欄または不正な値があります。"
      @customer = Customer.find(current_customer.id)
      @event = Event.new
      @menu = @event.menus.build
      @reps = @menu.reps.build
      render :new
      return
    end
    if @event.save
      current_customer.events.each do |event|
        event.menus.each do |menu|
          unless MyMenuItem.exists?(name: menu.name)
            my_menu = MyMenu.find_by(customer_id: current_customer.id, part: @event.part )
            MyMenuItem.create(name: menu.name, my_menu_id: my_menu.id, customer_id: current_customer.id)
          end
        end
      end
      flash[:success] = "トレーニングを保存しました！"
      redirect_to event_path(@event)
    else
      @customer = Customer.find(current_customer.id)
      @event = Event.new
      @menu = @event.menus.build
      @reps = @menu.reps.build
      flash[:alert] = "空欄または不正な値があります。"
      render :new
    end
  end
  

  def show
    @customer = Customer.find(current_customer.id)
    @event = Event.find(params[:id])
  end

  def index
    @customer = Customer.find(current_customer.id)
    @customers = @customer.following_customer
    @events = Event.order(start: :desc)
    if params[:name] == "全ユーザーを表示"
      @events = Event.order(start: :desc)
    elsif params[:name] == "フォローしたユーザーのみ表示"
      @customers.each do |customer|
        @events = Event.where(customer_id: customer.id).order(start: :desc)
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.customer_id != current_customer.id
      flash[:danger] = "他アカウントの編集はできません。"
      redirect_to customer_path(current_customer)
    end
    if @event.update(event_params)
      current_customer.events.each do |event|
        event.menus.each do |menu|
          unless MyMenuItem.exists?(name: menu.name)
            my_menu = MyMenu.find_by(customer_id: current_customer.id, part: @event.part )
            MyMenuItem.create(name: menu.name, my_menu_id: my_menu.id, customer_id: current_customer.id)
          end
          unless Rep.exists?(menu_id: menu.id)
          Rep.create(menu_id: menu.id, weight: 0, count: 0, set_count: 0)
          end
        end
      end
      flash[:success] = "トレーニングの編集が完了しました！"
      redirect_to event_path(@event)
    else
      flash[:alert] = "空欄または不正な値があります。"
      @customer = Customer.find(current_customer.id)
      @event = Event.find(params[:id])
      render :show
    end
  end

  def menus_and_reps_exists?(event)
    # eventが少なくとも一つ以上のmenuを持っているのを確認する。空だった場合は処理を停止
    if event.menus.blank?
      return false
    end
    # eventのmenuが少なくとも一つ以上のrepを持っているのを確認する。空だった場合は処理を停止
    event.menus.each do |menu|
      if menu.reps.blank?
        return false
      end
    end
    return true
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.customer_id != current_customer.id
      flash[:danger] = "他アカウントの編集はできません。"
      redirect_to customer_path(current_customer)
    end
    @event.destroy
    flash[:alert] = "トレーニングを削除しました。"
    redirect_to customer_path(current_customer)
  end

  private

  def event_params
    params.require(:event).permit(:part, :start, :end,
                                  menus_attributes:
                                  [
                                     :id, :name, :_destroy,
                                     reps_attributes:[:id, :weight, :count, :set_count, :_destroy]
                                  ])
  end
end
