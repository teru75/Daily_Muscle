class DatasController < ApplicationController
  before_action :authenticate_customer!
  def index
    @customer = Customer.find(params[:customer_id])
    if @customer.is_data_available == false
      flash[:alert] = "このアカウントのデータは許可されていません。"
      redirect_to customer_path(@customer)
    end
    @dayline = Array.new
    @timeline = Array.new
    count = 0
    @events = @customer.events.joins(:menus).where("menus.name == ?", params[:name]).order(start: "ASC").last(5)
    @events.each do |event|
      event.menus.each do |menu|
        if menu.name == params[:name] && count < 5
          count+= 1
          @dayline.push(menu.event.start.strftime('%m月%d日').to_s)
          @timeline.push(menu.reps.order(weight: "DESC").first[:weight])
        end
      end
    end

    # @partday = Array.new
    # @partday.push(Event.parts.keys.to_a)
    # @part_events = @customer.events.where("(events.start.year == ?) AND (events.start.month== ?)", 2020, 4).order(start: "ASC")
    # @whole_bodys = @part_events.where(part: :whole_body)
    # @upper_bodys = @part_events.where(part: :upper_body)
    # @arms = @part_events.where(part: :arm)
    # @breasts = @part_events.where(part: :breast)
    # @shoulders = @part_events.where(part: :shoulder)
    # @backs = @part_events.where(part: :back)
    # @lower_bodys = @part_events.where(part: :lower_body)
    # @trunks = @part_events.where(part: :trunk)
    # @part_count = Array.new([@whole_bodys.length, @upper_bodys.length, @arms.length, @breasts.length, @shoulders.length, @backs.length, @lower_bodys.length, @trunks.length])

  end
end
