class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @event = Event.where(created_at: Time.now.all_day)
  end
end
