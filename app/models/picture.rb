class Picture < ApplicationRecord
    belongs_to :product
    belongs_to :post
    
    mount_uploaders :image, PictureUploader
end
