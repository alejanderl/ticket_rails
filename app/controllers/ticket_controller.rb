class TicketController < ApplicationController
  def index
    @results = Cinema.order(:name)
  end
end
