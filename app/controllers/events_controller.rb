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
      @event = Event.new
      @menu = @event.menus.build
      @reps = @menu.reps.build
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
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
