class EventLikesController < ApplicationController
  before_action :authenticate_customer!
  def create
    @event = Event.find(params[:event_id])
    like = current_customer.event_likes.new(event_id: @event.id)
    like.save
  end

  def destroy
    @event = Event.find(params[:event_id])
    like = current_customer.event_likes.find_by(event_id: @event.id)
    like.destroy
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @likes = EventLike.where(customer_id: @customer.id)
  end

end
