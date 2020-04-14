class EventsController < ApplicationController
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
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
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
  end

  private
  def event_params
    params.require(:event).permit(:part, :start, :end,
        menus_attributes:
        [
        :id, :name, :position, :_destroy, reps_attributes:
        [:id, :weight, :count, :set_count, :_destroy
        ]
      ]
      )
  end

end
