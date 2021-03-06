class ShowsController < ApplicationController
  # GET /shows
  # GET /shows.json
  load_and_authorize_resource
  def index
    @shows = Show.includes.all
    @the_list = theme_variables(@shows)
    
    render "shared/_list_of_items"
  end
  #GET city/name
  def by_city
    @shows = Show.by_city(params[:city])
    logger.fatal @shows.inspect.to_s
    @the_list = theme_variables(@shows)
    render "shared/_list_of_items"
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
    @show = Show.includes(:image).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @show }
    end
  end

  # GET /shows/new
  # GET /shows/new.json
  def new
    @show = Show.new
    @show.build_image
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @show }
    end
  end

  # GET /shows/1/edit
  def edit
    @show = Show.find(params[:id])
  end

  # POST /shows
  # POST /shows.json
  def create
    logger.fatal params[:show]
    @show = Show.new(params[:show])

    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
        format.json { render json: @show, status: :created, location: @show }
      else
        format.html { render action: "new" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shows/1
  # PUT /shows/1.json
  def update
    @show = Show.find(params[:id])

    respond_to do |format|
      if @show.update_attributes(params[:show])
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show = Show.find(params[:id])
    @show.destroy

    respond_to do |format|
      format.html { redirect_to shows_url }
      format.json { head :no_content }
    end
  end
end
