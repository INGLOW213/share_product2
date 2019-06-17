class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    # 大学でログインした場合のコメント処理
    
    if current_college
      @college_comment = current_college.comments.build(comment_params)
      @college_comment.college_id = current_college.id
      @college_comment.company_id = nil
      @college_comment.product_id = @product.id
      @comments = @product.comments
      if @college_comment.save!
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
      
    # 企業でログインした場合のコメント処理  
    
    elsif current_company
      @company_comment = current_company.comments.build(comment_params)
      @company_comment.college_id = nil
      @company_comment.company_id = current_company.id
      @company_comment.product_id = @product.id
      @comments = @product.comments
      
      if @company_comment.save!
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:danger] = "コメントに失敗しました"
        redirect_back(fallback_location: root_path)
      end
      
    end
    
  end

  private
  
    def comment_params
      params.require(:comment).permit(:content)
    end    
end
