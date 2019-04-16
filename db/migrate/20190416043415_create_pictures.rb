class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :image
      t.integer :product_id
      t.integer :post_id

      t.timestamps
    end
  end
end
