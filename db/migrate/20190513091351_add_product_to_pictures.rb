class AddProductToPictures < ActiveRecord::Migration[5.2]
  def change
    add_reference :pictures, :product, foreign_key: true
  end
end
