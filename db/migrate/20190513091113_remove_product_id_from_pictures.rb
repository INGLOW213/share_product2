class RemoveProductIdFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_column :pictures, :product_id, :integer
  end
end
