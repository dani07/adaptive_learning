class AddTypeToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :type, :integer
    add_column :questions, :answer_id, :integer
  end
end
