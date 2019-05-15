class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :college_params, if: :devise_controller?
  
  add_flash_types :success, :info, :warning, :danger
  
  private
    
    def college_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
