class QuizzesController < ApplicationController
  def new
  	@quiz = Quiz.new
  	3.times { @quiz.questions.build }
  end

  def create
  	@quiz = Quiz.create(params[:quiz].permit(:title))
  	redirect_to quizzes_path
  end

  def index
  	@quiz = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end
end
