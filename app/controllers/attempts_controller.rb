class AttemptsController < ApplicationController
 
  def new
    @quiz = Quiz.find(params[:quiz_id])
  end
 
  def create
    @quiz = Quiz.find(params[:quiz_id])
    scorer = Scorer.new(@quiz)
    redirect_to root_path
    flash[:success] = "#{scorer.total(params[:answer_ids].values)}%"
  end
 
end
