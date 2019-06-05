class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :relationships
  has_many :followings , through: :relationships
 
# scope :search_by_keyword, -> (keyword) {
#     where("companies.name LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}%") if keyword.present?
#   }
  
  def follow(other_college)
    unless self == other_college
      self.relationships.find_or_create_by(college_id: other_college.id)
    end
  end
  
  def unfollow(other_college)
    relationship = self.relationship.find_by(college_id: other_college.id)
    self.relationships.destroy if relationship
  end
end
