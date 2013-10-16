class Quiz < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	
	has_many :questions, :dependent => :destroy
	accepts_nested_attributes_for :questions, :allow_destroy => true, :reject_if => lambda { |a| a[:query].blank? }
end
