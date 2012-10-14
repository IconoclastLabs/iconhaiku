# == Schema Information
#
# Table name: api_haikus
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  line1_slot1_id :integer
#  line1_slot2_id :integer
#  line1_slot3_id :integer
#  line1_slot4_id :integer
#  line1_slot5_id :integer
#  line2_slot1_id :integer
#  line2_slot2_id :integer
#  line2_slot3_id :integer
#  line2_slot4_id :integer
#  line2_slot5_id :integer
#  line2_slot6_id :integer
#  line2_slot7_id :integer
#  line3_slot1_id :integer
#  line3_slot2_id :integer
#  line3_slot3_id :integer
#  line3_slot4_id :integer
#  line3_slot5_id :integer
#  slug           :string(255)
#

require 'spec_helper'

describe Api::Haiku do
  pending "add some examples to (or delete) #{__FILE__}"
end
