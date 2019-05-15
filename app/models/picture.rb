class Picture < ApplicationRecord
    belongs_to :product
    belongs_to :college
    
    mount_uploaders :image, PictureUploader
end
