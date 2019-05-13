class Product < ApplicationRecord
  has_many :pictures
  
  accepts_nested_attributes_for :pictures
end
