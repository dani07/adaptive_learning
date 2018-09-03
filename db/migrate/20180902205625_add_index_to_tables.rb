class AddIndexToTables < ActiveRecord::Migration[5.0]
  def change
  	add_index :exams, [:name, :date_of_exam], :unique => true
  	add_index :topics, :name, :unique => true
  	add_index :chapters, [:topic_id, :title], :unique => true
  end
end
