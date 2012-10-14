class HomeController < ApplicationController
  def index
  end

  def create
  end

  def share
    @slug = params[:slug]
    @haiku = Api::Haiku.find_by_slug(@slug)
  end
end
