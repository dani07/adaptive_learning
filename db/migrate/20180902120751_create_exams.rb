class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.string :date_of_exam

      t.timestamps
    end
  end
end
