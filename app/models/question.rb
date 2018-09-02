class Question < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :chapter
  enum type: [:easy,:medium,:hard]
end
