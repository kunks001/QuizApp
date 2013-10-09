class QuizzesController < ApplicationController
  def new
  	@quiz = Quiz.new
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
  end


end
