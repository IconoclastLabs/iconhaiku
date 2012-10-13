class AddNounsToHaiku < ActiveRecord::Migration
  def change
    add_column :api_haikus, :line1_slot1_id, :integer
    add_column :api_haikus, :line1_slot2_id, :integer
    add_column :api_haikus, :line1_slot3_id, :integer
    add_column :api_haikus, :line1_slot4_id, :integer
    add_column :api_haikus, :line1_slot5_id, :integer
    add_column :api_haikus, :line2_slot1_id, :integer
    add_column :api_haikus, :line2_slot2_id, :integer
    add_column :api_haikus, :line2_slot3_id, :integer
    add_column :api_haikus, :line2_slot4_id, :integer
    add_column :api_haikus, :line2_slot5_id, :integer
    add_column :api_haikus, :line2_slot6_id, :integer
    add_column :api_haikus, :line2_slot7_id, :integer
    add_column :api_haikus, :line3_slot1_id, :integer
    add_column :api_haikus, :line3_slot2_id, :integer
    add_column :api_haikus, :line3_slot3_id, :integer
    add_column :api_haikus, :line3_slot4_id, :integer
    add_column :api_haikus, :line3_slot5_id, :integer
  end
end
