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
  has_many :nouns, through: :noun_tags
end
