class StaticPagesController < ApplicationController

  def home
  	@static_pages = Quiz.paginate(page: params[:page])
  end
end
