class Question < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :chapter
  has_many :answers
  enum type: [:easy,:medium,:hard]

  def correct_answer
  	Answer.find_by_id answer_id 
  end

end
