class RelationshipsController < ApplicationController
  def create
    @company = Company.find_by(id: params[:company_id])
    @college = College.find_by(id: params[:college_id])

        if @college == nil
         current_college.follow(@company)
         flash[:notice]='フォローしました'
           respond_to do |format|
            format.html { redirect_to @company }
            format.js
           end
        end
        
        if  @company == nil
         current_company.follow(@college)
         flash[:notice]='フォローしました'
           respond_to do |format|
            format.html { redirect_to @college }
            format.js
           end
        end
  end

  def destroy
    @company = Company.find_by(id: params[:company_id])
    @college = College.find_by(id: params[:college_id])
    
    if @college == nil
     current_college.unfollow(@company)
     flash[:notice]='アンフォローしました'
         respond_to do |format|
            format.html { redirect_to @company }
            format.js
           end
    end
    
    if  @company == nil 
         current_company.unfollow(@college)
         flash[:notice]='アンフォローしました'
         respond_to do |format|
            format.html { redirect_to @college }
            format.js
           end
    end
  end
end
