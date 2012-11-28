# == Schema Information
#
# Table name: api_noun_tags
#
#  noun_id :integer
#  tag_id  :integer
#

class Api::NounTag < ActiveRecord::Base
  attr_accessible :noun_id, :tag_id
  belongs_to :noun
  belongs_to :tag
end
