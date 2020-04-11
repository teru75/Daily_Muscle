class CustomersController < ApplicationController
  def show
     @events = Event.all
     @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def index
  end
end
