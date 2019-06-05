class Picture < ApplicationRecord
    belongs_to :product
    # belongs_to :college, inverse_of: :pictures
    
    mount_uploaders :image, PictureUploader
end
