module ApplicationHelper
    # def avater_url(college)
    #   if current_college
    #     return college.college_image unless college.college_image.nil?
    #     gravatar_id = Digest::MD5::hexdigest(college.email).downcase
    #     "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
    #   elsif current_company
    #     return company.company_image unless company.company_image.nil?
    #     gravatar_id = Digest::MD5::hexdigest(company.email).downcase
    #     "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
    #   end
    # end 
    
    # userはログインしている方がcollegeかcompanyかで変わる
    def college_avater_url(college)
        # collegeでログインしている場合は、user=@collegeが入り、そこにcollege_imageを適用する
        return college.college_image unless college.college_image.nil?
        gravatar_id = Digest::MD5::hexdigest(college.email).downcase
        "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
    end
    
    def company_avater_url(company)
      return company.company_image unless company.company_image.nil?
      gravatar_id = Digest::MD5::hexdigest(company.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
    end
    
end
