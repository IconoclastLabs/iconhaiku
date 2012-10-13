class Api::NounTags < ActiveRecord::Base
  belongs_to :noun
  belongs_to :tag
end