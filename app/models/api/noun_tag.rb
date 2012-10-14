class Api::NounTag < ActiveRecord::Base
  attr_accessible :noun_id, :tag_id
  belongs_to :noun
  belongs_to :tag
end