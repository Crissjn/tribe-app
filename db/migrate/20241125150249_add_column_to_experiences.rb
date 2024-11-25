class AddColumnToExperiences < ActiveRecord::Migration[7.1]
  def change
    add_column :experiences, :exp_type, :string
  end
end
