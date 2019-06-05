class Like < ApplicationRecord
    belongs_to :product
    belongs_to :company
    
    validates :company_id, uniqueness: { scope: :product_id}
    
        
end
