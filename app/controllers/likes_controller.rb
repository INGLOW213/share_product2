class LikesController < ApplicationController
  
  def create
   
    @product = Product.find_by(id: params[:product_id])
    ### current_collegeとcurrent_comapnyの分岐
    if current_college
      @like = current_college.likes.build(like_params)
      @like.company_id = nil 
      if @like.save!
         redirect_to @product
      else
         redirect_to @product
      end 
    elsif 
      @like = current_company.likes.build(like_params)
       @like.college_id = nil 
      if @like.save!
         redirect_to @product
      else
        redirect_to @product
      end 
    end
  end


  def destroy
    @like = Like.find_by(id: params[:id])
    @product = Product.find_by(id: params[:product_id])
    if current_college
        if @like.destroy
         redirect_to @product
        else
        redirect_to @product
        end
    else 
        if @like.destroy
         redirect_to @product
        else
        redirect_to @product
        end
    end
  end
  
  
   private
   
   def like_params
     params.permit(:product_id)
   end
 end

