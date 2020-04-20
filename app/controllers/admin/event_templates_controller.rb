class Admin::EventTemplatesController < ApplicationController
  def index
    @whole_bodys = EventTemplate.where(part: :whole_body)
    @upper_bodys = EventTemplate.where(part: :upper_body)
    @arms = EventTemplate.where(part: :arm)
    @shoulders = EventTemplate.where(part: :sholders)
    @breasts = EventTemplate.where(part: :breast)
    @backs = EventTemplate.where(part: :back)
    @lower_bodys = EventTemplate.where(part: :lower_body)
    @trunks = EventTemplate.where(part: :trunk)
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

  def update
    @event_template = EventTemplate.find(params[:id])
    if @event_template.update(event_template_params)
      flash[:success] = "メニューテンプレートが編集されました！"
      redirect_to admin_event_template_path(@event_template)
    else
      render :new
    end
  end

  private
  def event_template_params
    params.require(:event_template).permit(:part, :theme, :is_enabled,
        menu_templates_attributes:[:id, :name, :_destroy])
  end
end
