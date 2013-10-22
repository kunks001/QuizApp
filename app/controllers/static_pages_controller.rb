class StaticPagesController < ApplicationController

  def home
  	@static_pages = Quiz.paginate(page: params[:page], :per_page => 10)
  end
end
