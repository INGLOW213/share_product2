class AddCollegeToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :college, foreign_key: true
  end
end
