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
  attr_accessible :attribution, :license, :name
  has_and_belongs_to_many :tags

end
