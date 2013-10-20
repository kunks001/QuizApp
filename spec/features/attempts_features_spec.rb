require 'spec_helper'

describe "Attempts" do
	let(:user) { FactoryGirl.create(:user) }
	let(:quiz) { FactoryGirl.create(:quiz, user: user) }


	context 'when taking a quiz' do
	  before do
	  	sign_in(user)
	  	visit new_quiz_attempt_path(quiz)
	 
		  choose 'correct answer'
		 
		  click_button 'Submit'
		end
		
		it { expect(page).to have_content '100%' }
	end
end