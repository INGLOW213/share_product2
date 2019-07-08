class CreateMatchings < ActiveRecord::Migration[5.2]
  def change
    create_table :matchings do |t|
      t.references :product, foreign_key: true
      t.references :company, foreign_key: true
      
      t.timestamps
      
      t.index [:product_id, :company_id], unique: true
    end
  end
end
