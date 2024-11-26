class AddColumnToExperience < ActiveRecord::Migration[7.1]
  def change
    add_column :experiences, :title, :string
    add_column :experiences, :location, :string
  end
end
