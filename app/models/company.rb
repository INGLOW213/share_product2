class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes
  has_many :relationships
  has_many :followings , through: :relationships, source: :college
  # has_many :followings , through: :relationships
  # マッチングリレーション
  has_many :matchings
  has_many :matching_products, through: :matchings, source: :product
  has_many :comments
 
  def follow(other_college)
    unless self == other_college
      self.relationships.find_or_create_by(college_id: other_college.id)
    end
  end
  
  def unfollow(other_college)
    relationship = self.relationships.find_by(college_id: other_college.id)
    relationship.destroy if relationship
  end
  
  def following?(other_college)
   self.followings.include?(other_college)
  end
  
  def match_product(product)
    unless self == product
      self.matchings.find_or_create_by(product_id: product.id)
    end  
  end 
  
  def matching?(product)
    self.matching_products.include?(product)
  end

end
