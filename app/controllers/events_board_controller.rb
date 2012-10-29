class EventsBoardController < ApplicationController
  skip_authorize_resource
  def show
  end

  def index
    Event.transaction do
          @events1=Event.includes(:image, :room, :show).uniq_list
          @events2=Event.includes(:image, :room, :show).where(:serie_id => 0)
        end
        @events = (@events1 | @events2)
        @the_list = theme_variables(@events)
        
        render "shared/_list_of_items"
  end
end
