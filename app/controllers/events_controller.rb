class EventsController < ApplicationController
  before_action :authenticate_customer!
  def new
    @event = Event.new
    @menu = @event.menus.build
    @reps = @menu.reps.build
  end

  def create
    @event = Event.new(event_params)
    @event.customer_id = current_customer.id

    if @event.save
      flash[:success] = "トレーニングを保存しました！"
       redirect_to event_path(@event)
    else
      @event = Event.new
      @menu = @event.menus.build
      @reps = @menu.reps.build
      flash[:alert] = "空欄または不正な値があります。"
      render :new
    end
  end

  def show
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
      flash[:success] = "トレーニングの編集が完了しました！"
      redirect_to event_path(@event)
    else
      render :show
    end
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
        :id, :name, :_destroy, reps_attributes:
        [:id, :weight, :count, :set_count, :_destroy
        ]
      ]
      )
  end

end
