class Product < ApplicationRecord

  has_many :pictures
  belongs_to :college
  accepts_nested_attributes_for :pictures

end
