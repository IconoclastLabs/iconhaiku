class AddSourceUrlToNoun < ActiveRecord::Migration
  def change
    add_column :api_nouns, :source_url, :text
  end
end
