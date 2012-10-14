# == Schema Information
#
# Table name: api_tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Api::Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :noun_tags
  has_many :nouns, through: :noun_tags

  def as_json(options={})
    options[:methods] ||= [:icon_url]
    options[:only] ||= [:name]
    super(options)
  end
end
