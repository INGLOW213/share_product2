class Like < ApplicationRecord
    belongs_to :product
    belongs_to :company,optional: true
    belongs_to :college,optional: true
    counter_culture :product
        
end
