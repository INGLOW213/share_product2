class AddCollegeImageToColleges < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :college_image, :string
  end
end
