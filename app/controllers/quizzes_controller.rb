class QuizzesController < ApplicationController
  def new
  	@quiz = Quiz.new
  	3.times { @quiz.questions.build }
  end

  def create
  	# raise params.inspect
  	@quiz = Quiz.create(params[:quiz].permit(:title, questions_attributes: [:id, :query]))
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
        # raise params.inspect

  	@quiz = Quiz.find(params[:id])

  	if @quiz.update(quiz_params)
      # flash[:success] = "Profile updated"
      redirect_to @quiz
    else
      render 'edit'
    end
  end

  def destroy
  	Quiz.find(params[:id]).destroy
  	redirect_to quizzes_path
  end

  def quiz_params
    params.require(:quiz).permit(:title, questions_attributes: [:id, :quiz_id, :query, :_destroy])
  end
end
