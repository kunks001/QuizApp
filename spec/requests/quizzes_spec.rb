require 'spec_helper'

describe "Quizzes" do
	subject { page }
  describe "GET /quizzes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get quizzes_path
      response.status.should be(200)
    end
  end

  describe "GET /quizzes" do
    before { visit quizzes_path }

    it { should have_content('Quizzes') }
  end
end
