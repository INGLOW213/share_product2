class Product < ApplicationRecord

  has_many :pictures
  belongs_to :college
  accepts_nested_attributes_for :pictures
  
  default_scope -> { order(created_at: :desc) }
  
end
