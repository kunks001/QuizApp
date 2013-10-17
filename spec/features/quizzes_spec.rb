require 'spec_helper'

describe "QuizPages" do
	subject { page }

  describe "index" do
    before { visit quizzes_path }

    it { should have_content('Quizzes') }
  end

  describe "when signed in" do
    let(:user) { FactoryGirl.create(:user) }
    
    before do
      visit signin_path
      fill_in "Email",    with: user.email.upcase
      fill_in "Password", with: user.password
      click_button "Sign in"
    end

    describe 'and creating a new' do
      before do 
        visit "/quizzes/new"

        fill_in "quiz[title]", with: "makers_quiz"
        fill_in "quiz[questions_attributes][0][query]", with: "Why so many bugs?"
        fill_in "quiz[questions_attributes][0][answers_attributes][0][response]", with: "absolutely no idea"
        click_button "Submit"
      end

      describe "quiz" do
       	it { should have_content('Quizzes') }
       	it { should have_content("makers_quiz") }
      end

      describe "quiz's questions and answers" do
        before { click_link "#{Quiz.last.id}" }

        it 'should have the correct questions and answers' do
          expect(page).to have_content("Why so many bugs?")
          expect(page).to have_content("absolutely no idea")
        end
     	end
    end
  end

  describe "after making a quiz" do

    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in(user)
      @answer = Answer.create(response: 'No idea')
      @question = Question.create(query: 'Why?', answers: [@answer])
      @quiz = Quiz.create!(title: "Quiz", questions: [@question], user: user)
    end

    describe 'the show page' do
    	before do
  			visit quizzes_path
  			click_link "Quiz"
  		end

  		it { should have_content("Quiz") }
      it { should have_content("Why?") }
  	end

    describe 'the edit page' do
      before { visit edit_quiz_path(@quiz) }

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

      it 'can delete a question', js: true do
        click_link 'Remove question'
        click_button 'Submit'

        expect(page).to_not have_content "Why?"
      end

      it 'can delete an answer', js: true do
        click_link 'Remove'
        click_button 'Submit'

        expect(page).to_not have_content "No idea"
      end
    end
  end
end
