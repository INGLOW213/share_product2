class Product < ApplicationRecord

  has_many :pictures
  belongs_to :college
  
  # バリデーション
  validates :title, presence: true, length: { maximum: 70 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, presence: true,
                    numericality: { only_integer: true}
                    
  default_scope -> { order(created_at: :desc) }
  accepts_nested_attributes_for :pictures
end
