class Api::HaikusController < ApplicationController
  # GET /api/haikus
  # GET /api/haikus.json
  def index
    @api_haikus = Api::Haiku.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @api_haikus }
    end
  end

  # GET /api/haikus/1
  # GET /api/haikus/1.json
  def show
    @api_haiku = Api::Haiku.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api_haiku }
    end
  end

  # GET /api/haikus/new
  # GET /api/haikus/new.json
  def new
    @api_haiku = Api::Haiku.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @api_haiku }
    end
  end

  # GET /api/haikus/1/edit
  def edit
    @api_haiku = Api::Haiku.find(params[:id])
  end

  # POST /api/haikus
  # POST /api/haikus.json
  def create
    @api_haiku = Api::Haiku.new(params[:api_haiku])

    respond_to do |format|
      if @api_haiku.save
        format.html { redirect_to @api_haiku, notice: 'Haiku was successfully created.' }
        format.json { render json: @api_haiku, status: :created, location: @api_haiku }
      else
        format.html { render action: "new" }
        format.json { render json: @api_haiku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api/haikus/1
  # PUT /api/haikus/1.json
  def update
    @api_haiku = Api::Haiku.find(params[:id])

    respond_to do |format|
      if @api_haiku.update_attributes(params[:api_haiku])
        format.html { redirect_to @api_haiku, notice: 'Haiku was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @api_haiku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/haikus/1
  # DELETE /api/haikus/1.json
  def destroy
    @api_haiku = Api::Haiku.find(params[:id])
    @api_haiku.destroy

    respond_to do |format|
      format.html { redirect_to api_haikus_url }
      format.json { head :no_content }
    end
  end
end
