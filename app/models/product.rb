class Product < ApplicationRecord
  
  has_many :comments
  has_many :pictures
  belongs_to :college
  has_many :likes, -> { order(created_at: desc) },dependent: :destroy
  
    def liked_by(company)
        Like.find_by(company_id: company.id,product_id: id)
    end
  
    def like_by(college)
        Like.find_by(college_id: college.id,product_id: id)
    end
  
        
  
  # バリデーション
  validates :title, presence: true, length: { maximum: 70 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, presence: true,
                    numericality: { only_integer: true}
                    
  default_scope -> { order(created_at: :desc) }
  accepts_nested_attributes_for :pictures
  
  # default_scope -> { order(created_at: :desc) }
  # scope :search_by_keyword, -> (keyword) {
  #   # Blog.where(['title LIKE ? OR content LIKE ?', "%#{keyword}%", "%#{keyword}%"])
  #   # where("products.title LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}%") if keyword.present?
  #   where(["products.title LIKE ? OR products.content LIKE ?", "%#{keyword}%", "%#{keyword}%"]) if keyword.present?
  # }
  
end
