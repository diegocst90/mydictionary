class HomeCardsController < ApplicationController
  def index
  	@cards = params[:keywords] ? Card.where('name like ?',"%#{params[:keywords]}%") : []
  end
end
