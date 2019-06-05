class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :set_global_search_variable
  before_action :college_params, if: :devise_controller?
  before_action :company_params, if: :devise_controller?
  
  add_flash_types :success, :info, :warning, :danger
  
  # 検索はどこのページからでもしたいので、applicationコントローラ内に定義
  def set_global_search_variable
    @q_products = Product.ransack(params[:q_products], search_key: :q_products)
    @q_colleges = College.ransack(params[:q_colleges], search_key: :q_colleges)
    @q_companies = Company.ransack(params[:q_companies], search_key: :q_companies)
  end
  
  private
    
    def college_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
    
    def company_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :description])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description])
    end
    
    def require_current_college
      unless current_college
        flash[:warning] = "大学側としてログインしていただく必要がございます。"
        redirect_to "/colleges/sign_up"
      end
    end
    
    def require_current_company
      unless current_company
        flash[:warning] = "企業側としてログインしていただく必要がございます。"
        redirect_to "/companies/sign_up"
      end
    end
end
