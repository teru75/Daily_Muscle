class Admin::EventTemplatesController < ApplicationController
  def index
    @event_templates = EventTemplate.all
  end

  def new
    @event_template = EventTemplate.new
    @menu_template = @event_template.menu_templates.build
  end

  def create
    @event_template = EventTemplate.new(event_template_params)
    if @event_template.save
      flash[:success] = "メニューテンプレートを登録しました！"
       redirect_to admin_event_template_path(@event_template)
    else
      render :new
    end
  end

  def show
    @event_template = EventTemplate.find(params[:id])
  end

  def edit
    @event_template = EventTemplate.find(params[:id])
 end

  def update
  end

  private
  def event_template_params
    params.require(:event_template).permit(:part, :theme,
        menu_templates_attributes:[:id, :name, :status, :_destroy])
  end
end
