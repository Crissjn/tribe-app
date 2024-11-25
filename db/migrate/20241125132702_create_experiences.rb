class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.integer :max_participants
      t.integer :min_participants
      t.references :user, null:false, foreign_key:true
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
