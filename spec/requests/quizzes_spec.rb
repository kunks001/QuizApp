require 'spec_helper'

describe "QuizPages" do
	subject { page }

  describe "index" do
    before { visit quizzes_path }

    it { should have_content('Quizzes') }
  end

  describe "when creating a new quiz" do
  	before do 
  		visit "/quizzes/new"

			fill_in "quiz[title]", with: "makers_quiz"
   		click_button "Create Quiz"
	  end

   	it { should have_content('Quizzes') }
   	it { should have_content("makers_quiz") }
 	end

  describe 'show' do

  	before do
      question = Question.create(query: 'Why?')
  		Quiz.create(title: "Quiz", questions: [question])
			visit quizzes_path
			click_link "Quiz"
		end

		it { should have_content("Quiz") }
    it { should have_content("Why?") }
	end
end
