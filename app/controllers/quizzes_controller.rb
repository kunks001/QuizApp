class QuizzesController < ApplicationController

  before_action :signed_in_user, only: [:new, :edit, :update]

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def new
  	@quiz = Quiz.new
  	3.times do
      question = @quiz.questions.build
      4.times { question.answers.build }
    end
  end

  def create
  	@quiz = Quiz.create(params[:quiz].permit(:title, 
            questions_attributes: [:id, :query, answers_attributes: [:id, :response]]))
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
    params.require(:quiz).permit(:title, 
      questions_attributes: [:id, :quiz_id, :query, :_destroy, 
        answers_attributes: [:id, :question_id, :response, :_destroy]])
  end

end
