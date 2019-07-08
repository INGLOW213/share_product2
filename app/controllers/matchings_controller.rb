class MatchingsController < ApplicationController
  def create
    product = Product.find_by(id: params[:matching_product_id])
    if current_company.match_product(product)
      flash[:success] = "#{product.title}についての相談リクエストを#{product.college.name}へ送信しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "相談リクエストをそうしんできませんでした"
      redirect_back(fallback_location: root_path)
    end  
  end
  
  private

    def create_params
      params.permit(:matching_product_id)
    end
end
