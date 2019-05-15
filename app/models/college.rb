class College < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :pictures
  has_many :relationships
 
  has_many :followings , through: :relationships, source: :company
 
  
  def follow(other_company)
    unless self == other_company
      self.relationships.find_or_create_by(company_id: other_company.id)
    end
  end
  
  def unfollow(other_company)
    relationship = self.relationship.find_by(company_id: other_company.id)
    self.relationships.destroy if relationship
  end
end
