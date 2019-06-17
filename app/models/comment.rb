class Comment < ApplicationRecord
  belongs_to :college, optional: true
  belongs_to :company, optional: true
  belongs_to :product
end
