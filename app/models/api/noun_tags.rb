class Api::NounTags < ActiveRecord::Base
  attr_accessible :noun_id, :tag_id
  belongs_to :nouns
  belongs_to :tags
end