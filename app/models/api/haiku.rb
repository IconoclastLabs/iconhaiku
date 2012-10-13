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
#

class Api::Haiku < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  attr_accessible :name, 
                  :line1_slot1_id,
                  :line1_slot2_id, 
                  :line1_slot3_id, 
                  :line1_slot4_id, 
                  :line1_slot5_id, 
                  :line2_slot1_id, 
                  :line2_slot2_id, 
                  :line2_slot3_id, 
                  :line2_slot4_id, 
                  :line2_slot5_id, 
                  :line2_slot6_id, 
                  :line2_slot7_id, 
                  :line3_slot1_id, 
                  :line3_slot2_id, 
                  :line3_slot3_id, 
                  :line3_slot4_id, 
                  :line3_slot5_id 
end
