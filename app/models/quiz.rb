class Quiz < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	
	has_many :questions, :dependent => :destroy
	accepts_nested_attributes_for :questions, :allow_destroy => true, :reject_if => lambda { |a| a[:query].blank? }

	def correct_answer_ids
    questions.map { |q| q.correct_answer.first.id }
  end

  def answer_ids
  	answer_ids = []
  	questions.each do |q|
  		answer_ids << q.a_ids
  	end
  	answer_ids.flatten
  end
end
