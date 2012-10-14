class Api::NounsController < ApplicationController
  # GET /api/nouns
  # GET /api/nouns.json
  def index
    unless params[:tags].empty?
      @tag_names = params[:tags].split(",").flatten
      @tags = Api::Tag.find_all_by_name(@tag_names)
      @nouns = []
      @tags.each do |tag|
        @nouns = tag.nouns.map do |noun|
          p noun
          @nouns.push(noun.id)
        end
      end


      @api_nouns = Api::Noun.find_all_by_name(@tag_names)

      @api_nouns.push Api::Noun.find_all_by_id(@nouns)
      @api_nouns.flatten!
    else
      @api_nouns = Api::Noun.page params[:page]
      
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @api_nouns }
    end
  end


  # GET /api/nouns/1
  # GET /api/nouns/1.json
  def show
    @api_noun = Api::Noun.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api_noun }
    end
  end

  # GET /api/nouns/new
  # GET /api/nouns/new.json
  def new
    @api_noun = Api::Noun.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @api_noun }
    end
  end

  # GET /api/nouns/1/edit
  def edit
    @api_noun = Api::Noun.find(params[:id])
  end

  # POST /api/nouns
  # POST /api/nouns.json
  def create
    @api_noun = Api::Noun.new(params[:api_noun])

    respond_to do |format|
      if @api_noun.save
        format.html { redirect_to @api_noun, notice: 'Noun was successfully created.' }
        format.json { render json: @api_noun, status: :created, location: @api_noun }
      else
        format.html { render action: "new" }
        format.json { render json: @api_noun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api/nouns/1
  # PUT /api/nouns/1.json
  def update
    @api_noun = Api::Noun.find(params[:id])

    respond_to do |format|
      if @api_noun.update_attributes(params[:api_noun])
        format.html { redirect_to @api_noun, notice: 'Noun was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @api_noun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/nouns/1
  # DELETE /api/nouns/1.json
  def destroy
    @api_noun = Api::Noun.find(params[:id])
    @api_noun.destroy

    respond_to do |format|
      format.html { redirect_to api_nouns_url }
      format.json { head :no_content }
    end
  end
end
