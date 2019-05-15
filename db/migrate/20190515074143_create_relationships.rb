class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :college, foreign_key: true
      t.references :company, foreign_key: true
      
      t.index [:college_id, :company_id], unique: true
      t.timestamps
    end
  end
end
