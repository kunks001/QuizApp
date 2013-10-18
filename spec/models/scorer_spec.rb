require 'spec_helper'

describe Scorer do
	let(:user) { FactoryGirl.create(:user) }
	let(:quiz) { FactoryGirl.create(:quiz, user: user) }
 
  context 'all answers are wrong' do
    it 'should return 0' do
      scorer = Scorer.new(quiz)
      expect(scorer.total(answer_ids)).to eq(0)
    end
  end
 
end