class DatasController < ApplicationController
  def index
    if params[:menu] == "1"
    @menu = "ベンチプレス"
    end
    @customer = Customer.find(current_customer.id)
    @dayline = Array.new
    @timeline = Array.new
    count = 0
    @events = @customer.events.joins(:menus).where("menus.name = 'ベンチプレス'").order(start: "ASC").last(5)
    @events.each do |event|
      event.menus.each do |menu|
        if menu.name == @menu && count < 5
          count+= 1
          @dayline.push(menu.event.start.strftime('%m/%d').to_s)
          @timeline.push(menu.reps.order(weight: "DESC").first[:weight])
        end
      end
    end

# Event.joins(:customers, :menus).where("(customer: {id=?}) OR (menus: {name:?})", 1, "ベンチプレス")
# Customer.joins(events: :menus).where("(customer: {id=?}) OR (menus: {name:?})", 1, "ベンチプレス")
# Event.joins(:menus).where(menus: {name:"ベンチプレス"})
  end
end
