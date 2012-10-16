class EventsBoardController < ApplicationController
  def show
  end

  def index
    @events = Event.uniq_list
    
     respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @room }
     end
  end
end
