class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :college, foreign_key: true
      t.references :company, foreign_key: true
      t.references :product, foreign_key: true
      
      t.index [:college_id, :company_id, :product_id]
      t.timestamps
    end
  end
end
