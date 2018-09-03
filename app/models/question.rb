class Question < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :chapter
  has_many :answers
  has_one :correct_answer, class_name: 'Answer'
  enum type: [:easy,:medium,:hard]
end
