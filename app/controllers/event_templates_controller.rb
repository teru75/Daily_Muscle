class EventTemplatesController < ApplicationController
  def index
    @customer = Customer.find(current_customer.id)
    @event_template = EventTemplate.where(is_enabled: true)
    @whole_bodys = @event_template.where(part: :whole_body)
    @upper_bodys = @event_template.where(part: :upper_body)
    @arms = @event_template.where(part: :arm)
    @shoulders = @event_template.where(part: :sholders)
    @breasts = @event_template.where(part: :breast)
    @backs = @event_template.where(part: :back)
    @lower_bodys = @event_template.where(part: :lower_body)
    @trunks = @event_template.where(part: :trunk)
  end

  def show
    @customer = Customer.find(current_customer.id)
    @event_template = EventTemplate.find(params[:id])
    
  end
end
