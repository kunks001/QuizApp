require 'spec_helper'

describe "QuizPages" do
	subject { page }

  describe "index" do
    before { visit quizzes_path }

    it { should have_content('Quizzes') }
  end

  describe 'new' do
    before do 
      visit "/quizzes/new"

      fill_in "quiz[title]", with: "makers_quiz"
      fill_in "quiz[questions_attributes][0][query]", with: "Why so many bugs?"
      fill_in "quiz[questions_attributes][0][answers_attributes][0][response]", with: "absolutely no idea"
      click_button "Submit"
    end

    describe "when creating a new quiz" do
     	it { should have_content('Quizzes') }
     	it { should have_content("makers_quiz") }
    end

    describe "when creating quiz questions and answers" do
      before { click_link "#{Quiz.last.id}" }

      it 'should have the correct questions and answers' do
        expect(page).to have_content("Why so many bugs?")
        expect(page).to have_content("absolutely no idea")
      end
   	end
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
      @answer = Answer.create(response: 'No idea')
      @question = Question.create(query: 'Why?', answers: [@answer])
      @quiz = Quiz.create(title: "Quiz", questions: [@question])
      visit edit_quiz_path(@quiz)
    end

    it 'can update the quiz' do
      fill_in 'quiz[title]', with: 'XYZ'
      fill_in 'quiz[questions_attributes][0][query]', with: 'ABCDEF'
      fill_in "quiz[questions_attributes][0][answers_attributes][0][response]", with: "yes"
      click_button 'Submit'

      expect(page).to have_content "XYZ"
      expect(page).to have_content "ABCDEF"
      expect(page).to have_content "yes"
    end

    it 'can delete the quiz', js: true do
      visit quiz_path(@quiz)
      click_link_or_button 'delete_quiz'

      expect(page).to have_content 'Quiz'
    end

    it 'can delete a question' do
      within '.question' do
        click_link_or_button 'remove_question'
      end
      click_button 'Submit'

      expect(page).to_not have_content "Why?"
    end

    it 'can delete an answer' do
      within '.answer' do
        click_link_or_button 'remove_answer'
      end
      click_button 'Submit'

      expect(page).to_not have_content "No idea"
    end
  end
end
