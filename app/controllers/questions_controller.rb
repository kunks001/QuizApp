class QuestionsController < ApplicationController

	def new
		@question = Question.new
	end

	def create
		@question = Question.create(params[:question].permit(:id, :query, answers_attributes: [:response]))
	end

	def index
		@question = Question.all
	end

	def show
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		@question.update(question_params)
	end

	def destroy
		Question.find(params[:id]).destroy
	end

	def question_params
    params.require(:question).permit(:query, :_destroy, answers_attributes: [:id, :question_id, :response, :_destroy])
  end
end
