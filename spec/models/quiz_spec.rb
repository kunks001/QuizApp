require 'spec_helper'

describe Quiz do

  before do
    @quiz = Quiz.new(title: "makers_quiz")
  end

  subject { @quiz }

  it { should respond_to(:title) }
  it { should have_many(:questions) }
end
