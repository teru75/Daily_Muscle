class EventLikesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    like = current_customer.event_likes.new(event_id: @event.id)
    like.save
    redirect_to request.referer
  end

  def destroy
    @event = Event.find(params[:event_id])
    like = current_customer.event_likes.find_by(event_id: @event.id)
    like.destroy
    redirect_to request.referer
  end

end
