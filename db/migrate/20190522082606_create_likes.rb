class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      
      t.references :product, foreign_key: true, null: false
      t.references :company, foreign_key: true, null: false

      t.timestamps
    end
  end
end
