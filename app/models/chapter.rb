class Chapter < ApplicationRecord
  belongs_to :topic
  has_many :topics
end
