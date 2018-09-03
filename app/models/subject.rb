class Subject < ApplicationRecord
  belongs_to :exam
  has_many :topics
end
