require 'spec_helper'

describe Answer do
  before do
    @answer = Answer.new
  end

  subject { @answer }

  it { should belong_to(:question) }
end
