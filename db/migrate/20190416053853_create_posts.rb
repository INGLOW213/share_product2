class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.references :college, foreign_key: true, nill: false
      t.references :picture, foreign_key: true, nill: false
      t.timestamps
    end
  end
end
