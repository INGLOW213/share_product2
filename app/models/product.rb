class Product < ApplicationRecord
    has_many :pictures
    belongs_to :college
end
