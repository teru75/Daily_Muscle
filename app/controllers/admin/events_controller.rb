class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.page(params[:page]).reverse_order
  end
end
