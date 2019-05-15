class AddNameToColleges < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :name, :string, null: false, default: ""
  end
end
