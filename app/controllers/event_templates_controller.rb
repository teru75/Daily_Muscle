class EventTemplatesController < ApplicationController
  def index
    @customer = Customer.find(current_customer.id)
    @whole_bodys = EventTemplate.where(part: :whole_body)
    @upper_bodys = EventTemplate.where(part: :upper_body)
    @arms = EventTemplate.where(part: :arm)
    @shoulders = EventTemplate.where(part: :sholders)
    @breasts = EventTemplate.where(part: :breast)
    @backs = EventTemplate.where(part: :back)
    @lower_bodys = EventTemplate.where(part: :lower_body)
    @trunks = EventTemplate.where(part: :trunk)
  end

  def show
    @customer = Customer.find(current_customer.id)
    @event_template = EventTemplate.find(params[:id])
    
  end
end
