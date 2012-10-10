class SearchFilmsController < ApplicationController
  
  def index

    @films=Films.order(:name).where("name like ?","#{params[]}")
     render json: @films.map(&:name) 
  end
end
