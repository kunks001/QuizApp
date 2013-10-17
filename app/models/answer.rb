class Answer < ActiveRecord::Base
  belongs_to :question
  validates :correctness, inclusion: { in: [true, false] }
end
