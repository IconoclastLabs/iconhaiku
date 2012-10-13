class CreateApiNouns < ActiveRecord::Migration
  def change
    create_table :api_nouns do |t|
      t.string :name
      t.text :attribution
      t.string :license

      t.timestamps
    end
  end
end
