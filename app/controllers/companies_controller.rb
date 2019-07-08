class CompaniesController < ApplicationController
  def show
    @company = Company.find_by(id: params[:id])
    @matchings = Matching.new
    @match_product = @company.matching_products
  end
  
  def index
    @companies=Company.all
  end
  
end
