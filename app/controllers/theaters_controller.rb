class TheatersController < ApplicationController
  # GET /theaters
  # GET /theaters.json
  def index
    @theaters = Theater.all

   @the_list = theme_variables(@theaters)
        
        render "shared/_list_of_items"
  end

  # GET /theaters/1
  # GET /theaters/1.json
  def show
    @theater = Theater.includes(:rooms, :image).find(params[:id])
    @rooms = @theater.rooms
    
   
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @theater }
    end
  end

  # GET /theaters/new
  # GET /theaters/new.json
  def new
    @theater = Theater.new
    @theater.build_address
    @theater.build_image
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @theater }
    end
  end

  # GET /theaters/1/edit
  def edit
    @theater = Theater.find(params[:id])
       if @theater.address.present?
      logger.fatal "tiene direccion"
            
    end
     if !@theater.address.present?
      logger.fatal "no tiene direccion"
      @theater.build_address      
    end
  end

  # POST /theaters
  # POST /theaters.json
  def create
    @theater = Theater.new(params[:theater])

    respond_to do |format|
      if @theater.save
        format.html { redirect_to @theater, notice: 'Theater was successfully created.' }
        format.json { render json: @theater, status: :created, location: @theater }
      else
        format.html { render action: "new" }
        format.json { render json: @theater.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /theaters/1
  # PUT /theaters/1.json
  def update
    @theater = Theater.find(params[:id])
  

    respond_to do |format|
      if @theater.update_attributes(params[:theater])
        format.html { redirect_to @theater, notice: 'Theater was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @theater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theaters/1
  # DELETE /theaters/1.json
  def destroy
    @theater = Theater.find(params[:id])
    @theater.destroy

    respond_to do |format|
      format.html { redirect_to theaters_url }
      format.json { head :no_content }
    end
  end
end
