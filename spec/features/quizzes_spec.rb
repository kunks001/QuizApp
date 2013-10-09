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
   		click_button "Submit"
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

  describe 'edit' do

    before do
      @question = Question.create(query: 'Why?')
      @quiz = Quiz.create(title: "Quiz", questions: [@question])
    end

    it 'can update the quiz' do
      visit edit_quiz_path(@quiz)
      fill_in 'quiz[questions_attributes][0][query]', with: 'ABCDEF'
      click_button 'Submit'

      expect(page).to have_content "ABCDEF"
      # expect(@quiz.questions.first.query).to eq 'ABCDEF'
    end
  end

end
