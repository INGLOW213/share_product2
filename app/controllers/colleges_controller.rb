class CollegesController < ApplicationController
  def show
    @college = College.find_by(id: params[:id])
    @matchings = Matching.new
    # @match_products = @college.products.where(id: nil)
  end
end
