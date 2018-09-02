class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :exam, foreign_key: true
      t.integer :duration

      t.timestamps
    end
  end
end
