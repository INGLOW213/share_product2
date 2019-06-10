class LikesController < ApplicationController
  
  def create
    @like = current_company.likes.build(like_params)
    @product = Product.find_by(id: params[:product_id])
    if @like.save
     redirect_to @product
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @product = Product.find_by(id: params[:product_id])
    if @like.destroy
       redirect_to @product
    end
  end
  
  
   private
   
   def like_params
     params.permit(:product_id)
   end
   
end

