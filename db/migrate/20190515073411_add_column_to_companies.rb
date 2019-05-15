class AddColumnToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :name, :string
    add_column :companies, :description, :text
    add_column :companies, :company_image, :string
  end
end
