class RoomsController < ApplicationController
  # GET /rooms
  # GET /rooms.json
  before_filter :load_theater
  def index
    @rooms = @theater.rooms.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.find(params[:id])
    Event.transaction do
      @events1=@room.events.select(:serie_id).uniq
      @events2=@room.events.where(:serie_id => 0)
    end
    @events = (@events1 | @events2)
    
    @theater = Theater.find(@room.theater_id)
    
    #@room.extra_values = "prueba"
    logger.fatal  @events.inspect
    #logger.fatal @room.extra_values
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/new
  # GET /rooms/new.json
  def new
    
    @room = @theater.rooms.build
   # @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])    
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = @theater.rooms.build(params[:room])
    @room.extra_values = (params[:start_on])
    
    logger.fatal "hola"+@room.inspect
    
    respond_to do |format|
      if @room.save
        format.html { redirect_to @theater, notice: 'Room was successfully created.' }
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render action: "new" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])
    logger.fatal "hola"
    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    #@room = Room.find(params[:id])
    #@room.destroy

    respond_to do |format|
      format.html { redirect_to url_for(@theater) }
      format.json { head :no_content }
      
    end
  end
    def load_theater
      if params[:theater_id].present?
         @theater = Theater.find(params[:theater_id])
      end
  
  end
end
