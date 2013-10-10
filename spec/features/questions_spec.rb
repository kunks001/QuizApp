require 'spec_helper'

describe "Questions" do

  subject { page }

  describe 'delete' do

    before do
      @question = Question.create(query: 'Why?')
      @quiz = Quiz.create(title: "Quiz", questions: [@question])
      # visit edit_quiz_path(@quiz)
    end

    it 'can delete the question' do
      visit "/quizzes/#{@quiz.id}/edit"

      choose 'quiz[questions_attributes][0][_destroy]'
      click_button 'Submit'

      expect(page).to_not have_content "Why?"
      # expect(@quiz.questions.first.query).to eq 'ABCDEF'
    end
  end
end
