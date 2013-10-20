class AnswersController < ApplicationController
	
	def new
		@answer = Answer.new
	end

	def create
		@answer = Answer.create(params[:question].permit(:response))
	end

	def index
		@answer = Answer.all
	end

	def show
		@answer = Answer.find(params[:id])
	end

	def destroy
		Answer.find(params[:id]).destroy
	end

	def question_params
    params.require(:answer).permit(:id, :question_id, :response, :_destroy)
  end
end
