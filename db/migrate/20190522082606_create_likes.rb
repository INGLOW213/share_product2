class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      
      t.references :product, foreign_key: true, null: false
      t.integer :company_id

      t.timestamps
    end
  end
end
