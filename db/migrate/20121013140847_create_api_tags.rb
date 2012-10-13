class CreateApiTags < ActiveRecord::Migration
  def change
    create_table :api_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
