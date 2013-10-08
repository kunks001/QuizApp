require 'spec_helper'

describe "Quizzes" do
	subject { page }

  describe "GET /quizzes" do
    before { visit quizzes_path }

    it { should have_content('Quizzes') }
  end

  describe "GET /quizzes/new" do
  	before { visit "/quizzes/new" }

  	describe "when creating a new quiz" do
	   	before do 
				fill_in "quiz[title]", with: "makers_quiz"
	   		click_button "Create Quiz"
	   	end

	   	it { should have_content('Quizzes') }
	   	it { should have_content("makers_quiz") }
	 	end
	end


end
