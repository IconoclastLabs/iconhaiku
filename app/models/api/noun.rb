# == Schema Information
#
# Table name: api_nouns
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  attribution :text
#  license     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Api::Noun < ActiveRecord::Base

  attr_accessible :attribution, :license, :name, :icon
  has_many :noun_tags
  has_many :tags, through: :noun_tags
  has_attached_file :icon, 
                    styles: { :medium => "300x300>", :thumb => "100x100>" },
                    path: "icons/:id/:style/:filename"

  #virtual attributeto expose the icon url to the json method
  def icon_url
    icon.url(:thumb)
  end

  def as_json(options={})
    options[:methods] ||= [:icon_url]
    options[:except] ||= [:icon_updated_at, :icon_file_size,:created_at, :updated_at]
    super(options)
  end
end