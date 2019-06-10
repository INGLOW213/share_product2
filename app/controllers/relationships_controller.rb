class RelationshipsController < ApplicationController
  def create
    @company = Company.find_by(id: params[:company_id])
    @college =College.find_by(id: params[:college_id])

        if @college == nil
         current_college.follow(@company)
         flash[:notice]='フォローしました'
           redirect_to @company 
        end
        
        if  @company == nil
         current_company.follow(@college)
         flash[:notice]='フォローしました'
          redirect_to @college
           
        end
  end

  def destroy
    @company = Company.find_by(id: params[:company_id])
    @college = College.find_by(id: params[:college_id])
    
    if @college == nil
     current_college.unfollow(@company)
     flash[:notice]='アンフォローしました'
      respond_to do |format|
         redirect_to @company
           end
    end
    
    if  @company == nil 
         current_company.unfollow(@college)
         flash[:notice]='アンフォローしました'
          redirect_to @college 
    end
  end
end
