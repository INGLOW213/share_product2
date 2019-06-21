class AddCollegeIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :college_id, :integer
  end
end
