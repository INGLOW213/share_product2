class Like < ApplicationRecord
    belongs_to :product
    belongs_to :company,optional: true
    belongs_to :college,optional: true
    counter_culture :product
    validates :company_id, uniqueness: { scope: :product_id}
    
        
end
