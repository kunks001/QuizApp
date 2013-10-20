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

    let!(:user) { FactoryGirl.create(:user) }
    let!(:quiz) { FactoryGirl.create(:quiz, user: user) }

    before do
      sign_in(user)
    end

    describe 'the show page' do
    	before do
  			visit quiz_path(quiz)
  		end

  		it "should show the quiz's name and questions" do
        expect(page).to have_content("Quiz 2")
        expect(page).to have_content("question 2")
      end
  	end

    describe 'the edit page' do
      before { visit edit_quiz_path(quiz) }

      it 'can update the quiz' do
        fill_in 'quiz[title]', with: 'XYZ'
        fill_in 'quiz[questions_attributes][0][query]', with: 'ABCDEF'
        fill_in "quiz[questions_attributes][0][answers_attributes][1][response]", with: "yes"
        click_button "Submit"
        expect(page).to have_content "XYZ"
        expect(page).to have_content "ABCDEF"
        expect(page).to have_content "yes"
      end

      it 'can delete the quiz', js: true do
        visit quiz_path(quiz)
        click_link_or_button 'delete_quiz'

        expect(page).to_not have_content 'Quiz 1'
      end

      it 'can delete a question', js: true do
        click_link 'Remove question'
        click_button 'Submit'

        expect(page).to_not have_content "question 2"
      end

      it 'can delete an answer', js: true do
        click_link 'Remove', match: :first
        click_button 'Submit'

        expect(page).to_not have_content "No idea"
      end
    end

    describe "pagination" do
      # let(:user) { FactoryGirl.create(:user)}

      before(:all) do
        user = FactoryGirl.create(:user)
        50.times { FactoryGirl.create(:quiz, user: user) }
        sign_in user
      end

      after(:all)  { Quiz.delete_all }

      context "on the home page" do
        before { visit root_path }

        it { expect(page).to have_selector('.pagination') }

        it "should list each quiz" do
          Quiz.paginate(page: 1).each do |quiz|
            expect(page).to have_selector('li', text: quiz.title)
          end
        end
      end
    end
  end
end
