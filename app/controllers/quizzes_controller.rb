class QuizzesController < ApplicationController
  def new
  	@quiz = Quiz.new
  	3.times { @quiz.questions.build }
  end

  def create
  	# raise params.inspect
  	@quiz = Quiz.create(params[:quiz].permit(:title, questions_attributes: [:query]))
  	redirect_to quizzes_path
  end

  def index
  	@quiz = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end

  def edit
  	@quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end

  def update
  	@quiz = Quiz.find(params[:id])

  	if @quiz.update(params[:quiz].permit(:title, questions_attributes: [:id, :query]))
      # flash[:success] = "Profile updated"
      redirect_to @quiz
    else
      render 'edit'
    end
  end
end
