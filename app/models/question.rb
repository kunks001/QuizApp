class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => true, :reject_if => lambda { |a| a[:response].blank? }

  def correct_answer
  	answers.select { |a| a.correctness }
  end

  def a_ids
  	answers.map { |a| a.id }
  end
end
