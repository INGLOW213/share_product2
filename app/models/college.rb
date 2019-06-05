class College < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  # has_many :pictures, inverse_of: :college
  has_many :relationships
 
  has_many :followings , through: :relationships, source: :company
  
  # scope :search_by_keyword, -> (keyword) {
  #   where("colleges.name LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}%") if keyword.present?
  # }
 
  
  def follow(other_company)
    unless self == other_company
      self.relationships.find_or_create_by(company_id: other_company.id)
    end
  end
  
  def unfollow(other_company)
    relationship = self.relationships.find_by(company_id: other_company.id)
    relationship.destroy if relationship
  end
  
  def following?(other_company)
    self.followings.include?(other_company)
  end
end
