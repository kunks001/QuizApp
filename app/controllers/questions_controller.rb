class QuestionsController < ApplicationController

	def new
		@question = Question.new
	end

	def create
		@question = Question.create(params[:question].permit(:query))
	end

	def index
		@question = Question.all
	end

	def show
		@question = Question.find(params[:id])
	end
end
