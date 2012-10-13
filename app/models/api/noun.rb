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
  has_attached_file :icon, styles: { :medium => "300x300>", :thumb => "100x100>" }
end