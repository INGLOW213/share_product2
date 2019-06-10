class HomeController < ApplicationController
  def top
    # if params[:q_products]
    #   @result_products = Product.search_by_keyword(params[:q_products])
    # else
    #   @result_products = Product.all
    # end
    
    # if params[:q_colleges]
    #   @result_colleges = College.search_by_keyword(params[:q_colleges])
    # else
    #   @result_colleges = College.all
    # end
    
    # if params[:q_companies]
    #   @result_companies = Company.search_by_keyword(params[:q_companies])
    # else
    #   @result_companies = Company.all
    # end
    
    unless params[:q_products].blank?
      @q_products = Product.search(product_search_params)
      @result_products = @q_products.result
    else
      @result_products = Product.all
    end
    
    unless params[:q_colleges].blank?
      @q_colleges = College.search(college_search_params)
      @result_colleges = @q_colleges.result
    else
      @result_colleges = College.all
    end
    
    unless params[:q_companies].blank?
      @q_companies = Company.search(company_search_params)
      @result_companies = @q_companies.result
    else
      @result_companies = Company.all
    end
    
  end
  
  def search
    top
    render :top
  end
  
  private
    
    def product_search_params
      params.require(:q_products).permit(:title_cont, :content_cont)
    end
    
    def college_search_params
      params.require(:q_colleges).permit(:name_cont)
    end
    
    def company_search_params
      params.require(:q_companies).permit(:name_cont)
    end
end
