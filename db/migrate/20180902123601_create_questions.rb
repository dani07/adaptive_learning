class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :qtext
      t.integer :qno
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
