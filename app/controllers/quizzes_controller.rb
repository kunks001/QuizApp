class QuizzesController < ApplicationController
  def new
  	@quiz = Quiz.new
  end

  def create
  	@quiz = Quiz.create(params[:quiz].permit(:title))
  	redirect_to "static_pages#home"
  end

  def index
  	@quiz = Quiz.all
  end


end
