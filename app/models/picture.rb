class Picture < ApplicationRecord
    belongs_to :product
    belongs_to :post
end
