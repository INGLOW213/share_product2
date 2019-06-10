class Like < ApplicationRecord
    belongs_to :product
    belongs_to :company
    counter_culture :product
    validates :company_id, uniqueness: { scope: :product_id}
    
        
end
