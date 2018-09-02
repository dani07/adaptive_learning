class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.references :subject, foreign_key: true
      t.boolean :is_primary

      t.timestamps
    end
  end
end
