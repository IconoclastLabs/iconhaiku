class AddNounNumberToNouns < ActiveRecord::Migration
  def change
    add_column :api_nouns, :noun_number, :integer
  end
end
