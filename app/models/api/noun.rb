# == Schema Information
#
# Table name: api_nouns
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  attribution       :text
#  license           :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  icon_file_name    :string(255)
#  icon_content_type :string(255)
#  icon_file_size    :integer
#  icon_updated_at   :datetime
#  source_url        :text
#

class Api::Noun < ActiveRecord::Base
  paginates_per 15
  attr_accessible :attribution, :license, :name, :icon, :source_url
  has_many :noun_tags
  has_many :tags, through: :noun_tags
  has_attached_file :icon, 
                    styles: { :medium => "300x300>", :thumb => "100x100>" }
                    #,path: "icons/:id/:style/:filename"

  #virtual attributeto expose the icon url to the json method
  def icon_url
    icon.url(:original)
  end

  def as_json(options={})
    options[:methods] ||= [:icon_url]
    options[:except] ||= [:icon_updated_at, :icon_file_size,:created_at, :updated_at]
    super(options)
  end
end
