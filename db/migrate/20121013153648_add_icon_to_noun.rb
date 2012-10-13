class AddIconToNoun < ActiveRecord::Migration
  def self.up
    add_attachment :api_nouns, :icon
  end

  def self.down
    add_attachment :api_nouns, :icon
  end
end
