class Product < ApplicationRecord

  has_many :pictures
  belongs_to :college
  has_many :likes, -> { order(created_at: desc) },dependent: :destroy
  
    def liked_by(company)
        Like.find_by(company_id: company.id,product_id: id)
    end
  
        
  
  # バリデーション
  validates :title, presence: true, length: { maximum: 70 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, presence: true,
                    numericality: { only_integer: true}
                    
  default_scope -> { order(created_at: :desc) }
  accepts_nested_attributes_for :pictures
end
