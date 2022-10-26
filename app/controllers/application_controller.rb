class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:index,:show] 
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # 情報更新時にnameの取得を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
