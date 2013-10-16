require 'spec_helper'

describe Quiz do
	let(:user) { FactoryGirl.create(:user) }
	before { @quiz = user.quizzes.build(title: "Makers Quiz") }

  subject { @quiz }

  it { should respond_to(:title) }
  it { should have_many(:questions) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  describe "when user_id is not present" do
    before { @quiz.user_id = nil }
    it { should_not be_valid }
  end
end
