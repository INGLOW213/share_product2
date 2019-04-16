class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :college_id
      t.integer :company_id

      t.timestamps
    end
  end
end
