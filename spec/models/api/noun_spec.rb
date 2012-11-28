# == Schema Information
#
# Table name: api_nouns
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  attribution       :text
#  license           :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  icon_file_name    :string(255)
#  icon_content_type :string(255)
#  icon_file_size    :integer
#  icon_updated_at   :datetime
#  source_url        :text
#  noun_number       :integer
#

require 'spec_helper'

describe Api::Noun do
  pending "add some examples to (or delete) #{__FILE__}"
end
