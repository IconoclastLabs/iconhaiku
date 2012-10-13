# == Schema Information
#
# Table name: api_haikus
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Api::Haiku < ActiveRecord::Base
  attr_accessible :name
end
