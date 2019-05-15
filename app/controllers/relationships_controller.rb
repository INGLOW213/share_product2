class RelationshipController < ApplicationController
  def create
    @company = Company.find(params[:id])
    @college =College.find(params[:id])
    
    if  @company 
     cullent_college.follow(@company)
     redirect_to root_url
    else
      cullent_company.follow(@college)
      redirect_to root_url
    end
    
  end

  def destroy
    @company = Company.find(params[:id])
  end
end
