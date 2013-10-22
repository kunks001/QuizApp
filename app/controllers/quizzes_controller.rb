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
  	@quiz = current_user.quizzes.build(params[:quiz].permit(:title, 
            questions_attributes: [:id, :query, answers_attributes: [:id, :response, :correctness]]))
    if @quiz.save
    	redirect_to quizzes_path
    else
      render 'new'
    end
  end

  def index
  	@quizzes = Quiz.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end

  def edit
  	@quiz = current_user.quizzes.find(params[:id])
    @questions = @quiz.questions
  end

  def update
  	@quiz = current_user.quizzes.find(params[:id])

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
        answers_attributes: [:id, :question_id, :response, :correctness, :_destroy]])
  end

end
