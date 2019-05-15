module ApplicationHelper
    def avater_url(college)
      return college.college_image unless college.college_image.nil?
      gravatar_id = Digest::MD5::hexdigest(college.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
    end
end
