class TicketController < ApplicationController
  load_and_authorize_resource
  def index
    @results = Theater.order(:name).all
    
  end
end
