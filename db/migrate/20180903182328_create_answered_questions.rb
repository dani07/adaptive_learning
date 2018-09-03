class CreateAnsweredQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :answered_questions do |t|
      t.integer :answer_id
      t.integer :question_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
