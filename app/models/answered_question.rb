class AnsweredQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_one :answer
end
