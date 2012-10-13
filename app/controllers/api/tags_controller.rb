class Api::TagsController < ApplicationController
  # GET /api/tags
  # GET /api/tags.json
  def index
    @api_tags = Api::Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @api_tags }
    end
  end

  # GET /api/tags/1
  # GET /api/tags/1.json
  def show
    @api_tag = Api::Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api_tag }
    end
  end

  # GET /api/tags/new
  # GET /api/tags/new.json
  def new
    @api_tag = Api::Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @api_tag }
    end
  end

  # GET /api/tags/1/edit
  def edit
    @api_tag = Api::Tag.find(params[:id])
  end

  # POST /api/tags
  # POST /api/tags.json
  def create
    @api_tag = Api::Tag.new(params[:api_tag])

    respond_to do |format|
      if @api_tag.save
        format.html { redirect_to @api_tag, notice: 'Tag was successfully created.' }
        format.json { render json: @api_tag, status: :created, location: @api_tag }
      else
        format.html { render action: "new" }
        format.json { render json: @api_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api/tags/1
  # PUT /api/tags/1.json
  def update
    @api_tag = Api::Tag.find(params[:id])

    respond_to do |format|
      if @api_tag.update_attributes(params[:api_tag])
        format.html { redirect_to @api_tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @api_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/tags/1
  # DELETE /api/tags/1.json
  def destroy
    @api_tag = Api::Tag.find(params[:id])
    @api_tag.destroy

    respond_to do |format|
      format.html { redirect_to api_tags_url }
      format.json { head :no_content }
    end
  end
end
