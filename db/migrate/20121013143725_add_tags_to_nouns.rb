class AddTagsToNouns < ActiveRecord::Migration
  def self.up
    create_table :api_noun_tags, :id => false do |t|
      t.integer :noun_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :noun_tags
  end
end
