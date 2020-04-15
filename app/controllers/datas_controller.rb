class DatasController < ApplicationController
  def index
    @customer = Customer.find(current_customer.id)
    @customer.events.each do |event|
      event.menus.each do |menu|
        if menu.name == "ベンチプレス"
          @graphdays =  @customer.events.order(start: "DESC").limit(6).reverse
          @dayline = Array.new
          @graphdays.each do |graphday|
              @dayline.push(graphday.start.strftime('%m/%d').to_s)
          end
          @graphtimes =  menu.reps.order(weight: "DESC").limit(6).reverse
          @timeline = Array.new
          @graphtimes.each do |graphtime|
            @timeline.push(graphtime.weight)
          end
        end
      end
    end

# Event.joins(:customers, :menus).where("(customer: {id=?}) OR (menus: {name:?})", 1, "ベンチプレス")
# Customer.joins(events: :menus).where("(customer: {id=?}) OR (menus: {name:?})", 1, "ベンチプレス")
# Event.joins(:menus).where(menus: {name:"ベンチプレス"})
  end
end
