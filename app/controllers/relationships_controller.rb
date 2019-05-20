class RelationshipsController < ApplicationController
  def create
    @company = Company.find_by(id: params[:company_id])
    @college =College.find_by(id: params[:college_id])
    
    if  @company 
     current_college.follow(@company)
     flash[:notice]='フォローしました'
     redirect_to @company
    else
      flash[:danger]='フォローできませんでした'
    redirect_to @company
    end
    
    if  @college 
     current_company.follow(@college)
     flash[:notice]='フォローしました'
     redirect_to @college
　　else
      flash[:danger]='フォローできませんでした'
      redirect_to @college
    end
    
  end

  def destroy
    @company = Company.find(params[:company_id])
    @college = College.find_by(id: params[:college_id])
    
    if @company 
     current_college.unfollow(@company)
     flash[:notice]='アンフォローしました'
     redirect_to @company
    else
      flash[:danger]='アンフォローできませんでした'
    redirect_to root_url
    end
  end
end
