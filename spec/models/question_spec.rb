require 'spec_helper'

describe Question do
  before do
    @question = Question.new
  end

  subject { @question }

  it { should belong_to(:quiz) }
  it { should have_many(:answers) }
end
