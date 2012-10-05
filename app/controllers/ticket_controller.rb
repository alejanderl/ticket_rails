class TicketController < ApplicationController
  def index
    @results = Theater.order(:name).limit(-1).all
    
  end
end
