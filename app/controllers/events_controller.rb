class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  include IceCube
  before_filter :load_room
  before_filter :get_show_id  , :only => [:create, :update]
  after_filter :recurrences_save, :only => [:create, :update]
  

  autocomplete :show, :name, :full => true
  
  def remove_serie
   #@event  = Event.where(:serie_id => params[:serie_id]).first
    Event.destroy_all("serie_id = #{params[:serie_id]}")
    respond_to do |format|
      format.html {
     render :nothing => true, :status => 200, :content_type => 'text/html'    
      }
    end   
  end
  
  
  
  def index
    @events = @room.events.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
  
  def show_serie
    @events = Event.where("serie_id  = #{params[:serie_id]}")
    @room=""
    respond_to do |format|
      format.html {# show.html.erb
      #render "events/show_serie"
    #
    render "show_serie", :locals => { :events => @events }, :layout => false
    
      }

    end

    
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.includes(:room, :image).find(params[:id])
    
    @room = @event.room
    @theater = Theater.find(@room.theater_id)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = @room.events.build
    @event.show_id = 0
    @event.build_image
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    
    @event = @room.events.build(params[:event])
    
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to @room, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.includes(:room,:image).find(params[:id])
    @room = @event.room
    
    get_show_id
   # @event.show_id = 2
    respond_to do |format|
      if @event.update_attributes(params[:event])
        
        format.html { redirect_to @room, notice: 'Event was successfully updated' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1dsdvcsd
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.js { render "delete_event"}
      format.html { redirect_to @room }
      format.json { head :no_content }
    end
  end
  
  def load_room
    if params[:room_id].present?
      @room = Room.find(params[:room_id])
      @theater = Theater.find(@room.theater_id)
    end
   
  end

  def get_show_id 
   
    params[:event][:show_id] = params[:show_id_hidden]
    
  end
  
  private
  
 
  
  def recurrences_save

    if(params[:recurrence][:every]!="")
      
      #day when the recurrence event is starting
      if @event.serie_id == 0
        @event.serie_id = @event.id
        @event.save
      end
      start_day = @event.date.to_time
      l = (params[:recurrence][:end_date].to_s)
      
      #final day for the recurrence
      final_day = Date.strptime(l,'%m/%d/%Y').to_time
      #carefull with infinite rules!!! 
      final_day = start_day + 1.year if final_day > start_day + 1.year
      schedule = Schedule.new(start_day)
       
      if(params[:recurrence][:every]==Event::RECURRENCE[0][1].to_s)
        daily_recurrence = params[:recurrence][:daily].to_f
        schedule.add_recurrence_rule Rule.daily(daily_recurrence)
          i = 0
          Event.transaction do 
          
          schedule.each_occurrence do |t|
          
          var_name = "@event" + i.to_s
          params[:event][:image_attributes][:file]= ""
          
          current_event=self.instance_variable_set(var_name,@room.events.build(params[:event]))
          current_event.build_image
          current_event.serie_id = @event.serie_id
          current_event.image_id = @event.image_id
          current_event.date = t
          
          
          current_event.save if i!=0
          
            i += 1
            break if t > final_day
          end
          end
          
      end
      
    end
    
  end
  

  
end
