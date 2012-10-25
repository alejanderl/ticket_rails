class TicketController < ApplicationController
  def index
    @results = Theater.order(:name).all
    
  end
end
