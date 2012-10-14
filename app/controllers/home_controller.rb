class HomeController < ApplicationController
  def index
  end

  def create
  end

  def share
    @slug = params[:slug]
    @haiku = Api::Haiku.find_by_slug(@slug)
    noun_ids = [
      @haiku[:line1_slot1_id],
      @haiku[:line1_slot2_id],
      @haiku[:line1_slot3_id],
      @haiku[:line1_slot4_id],
      @haiku[:line1_slot5_id],
      @haiku[:line2_slot1_id],
      @haiku[:line2_slot2_id],
      @haiku[:line2_slot3_id],
      @haiku[:line2_slot4_id],
      @haiku[:line2_slot5_id],
      @haiku[:line2_slot6_id],
      @haiku[:line2_slot7_id],
      @haiku[:line3_slot1_id],
      @haiku[:line3_slot2_id],
      @haiku[:line3_slot3_id],
      @haiku[:line3_slot4_id],
      @haiku[:line3_slot5_id]
    ]
    @nouns = {};
    begin
      noun_ids.each do |n|
        @nouns[n] = Api::Noun.find(n).icon_url
      end
    rescue
    end


  end
end
