class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました。"
    customer_path(current_customer)
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = "新規登録しました。"
    customer_path(current_customer)
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました。"
    root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
