require 'spec_helper'

describe Quiz do
	let(:user) { FactoryGirl.create(:user) }

  before do
    @quiz = Quiz.new(title: "makers_quiz", user_id: user.id)
  end

  subject { @quiz }

  it { should respond_to(:title) }
  it { should have_many(:questions) }
  it { should respond_to(:user_id) }
end
