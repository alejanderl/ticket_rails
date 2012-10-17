class EventsBoardController < ApplicationController
  def show
  end

  def index
    Event.transaction do
          @events1=Event.uniq_list
          @events2=Event.where(:serie_id => 0)
        end
        @events = (@events1 | @events2)
        
     respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @room }
     end
  end
end
